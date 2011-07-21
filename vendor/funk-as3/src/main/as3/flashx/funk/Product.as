/*
 * This file is part of funk-as3.
 *
 * funk-as3 is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * funk-as3 is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Apparat. If not, see <http://www.gnu.org/licenses/>.
 *
 * Copyright (C) 2010 Joa Ebert
 * http://www.joa-ebert.com/
 */

package flashx.funk {
  import flashx.funk.collections.IIterator
  import flashx.funk.error.AbstractMethodError;
  import flashx.funk.util.isAbstract
  import flashx.funk.util.ne;
  import flashx.funk.util.requireRange;

  public class Product implements IProduct {
    [Abstract] public function get productArity(): int { return isAbstract() }

    [Abstract] public function productElement(i: int): * { return isAbstract() }

    public function get productPrefix(): String {
      return ""
    }

    public function equals(that: IFunkObject): Boolean {
      if (that is IProduct) {
        const thatProduct: IProduct = IProduct(that)

        if(productArity == thatProduct.productArity) {
          var n: int = productArity
          
          while(--n > -1) {
            if(ne(this.productElement(n), thatProduct.productElement(n))) {
              return false
            }
          }

          return true
        }
      }

      return false
    }

    /**
     * @inheritDoc
     */
    public function mkString(separator: String): String {
      const n: int = productArity
      const m: int = n - 1

      var buffer: String = ""
      var i: int

      for(i = 0; i < n; ++i) {
        buffer += productElement(0)

        if(i != m) {
          buffer += separator
        }
      }

      return buffer
    }

    public function toString(): String {
      if(0 == productArity) {
        return productPrefix
      }

      return productPrefix+"("+mkString(",")+")"
    }

    protected function validateIndex(i: int): void { requireRange(i, productArity) }

    public function get iterator(): IIterator {
      return new ProductIterator(this)
    }
  }
}