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
  public function toList(value: *): IList {
    var l: IList = nil
    var n: int

    if(value is IList) {
      return value
    } else if(value is Array) {
      var array: Array = value as Array
      n = array.length

      while(--n > -1) {
        l = l.prepend(array[n])
      }

      return l
    } else if(value is Vector) {
      var vector: Vector = value as Vector
      n = vector.length

      while(--n > -1) {
        l = l.prepend(vector[n])
      }

      return l
    } else if(value is String) {
      var string: String = String(value)
      n = string.length

      while(--n > -1) {
        l = l.prepend(string.substr(n, 1))
      }

      return l
    } else {
      return list(value)
    }
  }
}