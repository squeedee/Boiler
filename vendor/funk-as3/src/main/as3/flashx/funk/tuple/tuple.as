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
  import flashx.funk.error.IllegalByDefinitionError;
  import flashx.funk.util.require;

  public function tuple(... rest): ITuple {
    const n: int = rest.length

    require(n > 0, "At least one element must be speficied.")
    require(n < 9, "No more than eight elements are supported.")

    switch(n) {
      case 8: return new Tuple8Impl(rest[0], rest[1], rest[2], rest[3], rest[4], rest[5], rest[6], rest[7])
      case 7: return new Tuple7Impl(rest[0], rest[1], rest[2], rest[3], rest[4], rest[5], rest[6])
      case 6: return new Tuple6Impl(rest[0], rest[1], rest[2], rest[3], rest[4], rest[5])
      case 5: return new Tuple5Impl(rest[0], rest[1], rest[2], rest[3], rest[4])
      case 4: return new Tuple4Impl(rest[0], rest[1], rest[2], rest[3])
      case 3: return new Tuple3Impl(rest[0], rest[1], rest[2])
      case 2: return new Tuple2Impl(rest[0], rest[1])
      case 1: return new Tuple1Impl(rest[0])
      default: throw new IllegalByDefinitionError()
    }
  }
}