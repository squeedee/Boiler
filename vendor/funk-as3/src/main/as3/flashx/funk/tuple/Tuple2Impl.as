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

package flashx.funk.tuple {
  import flashx.funk.Product;

  internal final class Tuple2Impl extends Product implements ITuple2 {
    private var __1: *
    private var __2: *

    public function Tuple2Impl(_1: *, _2: *) {
      __1 = _1
      __2 = _2
    }

    public function get _1():* { return __1 }
    public function get _2():* { return __2 }

    override public function get productArity(): int {
      return 2
    }

    override public function productElement(i: int): * {
      switch(i) {
        case 0: return __1
        case 1: return __2
        default: throw new RangeError()
      }
    }
  }
}