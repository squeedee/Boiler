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

  internal final class LazyImpl extends Product implements ILazy {
    private var _f: Function
    private var _thisArg: *
    private var _argArray: Array
    private var _value: *
    private var _evaluated: Boolean = false

    public function LazyImpl(f: Function, thisArg: * = null, argArray: Array = null) {
      _f = f
      _thisArg = thisArg
      _argArray = argArray
    }

    /**
     * @inheritDoc
     */
    public function get get(): * {
      if(!_evaluated) {
        _value = _f.apply(_thisArg, _argArray)
        _evaluated = true
        _thisArg = null
        _argArray = null
        _f = null
      }

      return _value
    }

    /**
     * @inheritDoc
     */
    override public function productElement(i: int): * {
      if(0 == i) {
        return get
      }

      throw new RangeError("Index " + i + " is out of bounds.")
    }

    /**
     * @inheritDoc
     */
    override public function get productArity(): int {
      return 1
    }
  }
}