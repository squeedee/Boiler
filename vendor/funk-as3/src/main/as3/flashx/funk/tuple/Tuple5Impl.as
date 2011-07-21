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

  internal final class Tuple5Impl extends Product implements ITuple5 {
    private var __1: *
    private var __2: *
    private var __3: *
    private var __4: *
    private var __5: *

    public function Tuple5Impl(_1: *, _2: *, _3: *, _4: *, _5: *) {
      __1 = _1
      __2 = _2
      __3 = _3
      __4 = _4
      __5 = _5
    }

    public function get _1():* { return __1 }
    public function get _2():* { return __2 }
    public function get _3():* { return __3 }
    public function get _4():* { return __4 }
    public function get _5():* { return __5 }

    override public function get productArity(): int {
      return 5
    }

    override public function productElement(i: int): * {
      switch(i) {
        case 0: return __1
        case 1: return __2
        case 2: return __3
        case 3: return __4
        case 4: return __5
        default: throw new RangeError()
      }
    }
  }
}