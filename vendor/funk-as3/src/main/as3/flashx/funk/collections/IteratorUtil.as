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
  import flashx.funk.IFunkObject
  import flashx.funk.util.isAbstract
  import flashx.funk.util.ne

  public final class IteratorUtil {
    public static function eq(thisIter: IIterator, that: IFunkObject): Boolean {
      if(that is IIterator) {
        const thatIter: IIterator = IIterator(that)
        var thisHasNext: Boolean
        var thatHasNext: Boolean

        while(true) {
          thisHasNext = thisIter.hasNext
          thatHasNext = thatIter.hasNext

          if(thisHasNext && thatHasNext) {
            if(ne(thisIter.next(), thatIter.next())) {
              return false
            }
          } else if(!thisHasNext && !thatHasNext) {
            break
          } else {
            return false
          }
        }

        return true
      }
      
      return false
    }

    public static function toArray(iter: IIterator): Array {
      const array: Array = []

      while(iter.hasNext) {
        array.push(iter.next())
      }

      return array
    }

    public static function toVector(iter: IIterator): Vector.<*> {
      const vector: Vector.<*> = new Vector.<*>()

      while(iter.hasNext) {
        vector.push(iter.next())
      }

      return vector
    }

    public static function toList(iter: IIterator): IList {
      var l: IList = nil

      while(iter.hasNext) {
        l = l.prepend(iter.next())
      }

      return l.reverse
    }

    [Abstract] public function IteratorUtil() { isAbstract() }
  }
}