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

package flashx.funk.collections {
  import flashx.funk.util.require

  public final class Range {
    public static function to(start: int, end: int): IList {
      require(start < end, "Start must be less than end.")

      const m: int = start - 1
      var n: int = end + 1
      var l: IList = nil

      while(--n > m) {
        l = l.prepend(n)
      }

      return l
    }

    public static function until(start: int, end: int): IList {
      require(start < end, "Start must be less than end.")

      const m: int = start - 1
      var n: int = end
      var l: IList = nil

      while(--n > m) {
        l = l.prepend(n)
      }

      return l
    }
  }
}