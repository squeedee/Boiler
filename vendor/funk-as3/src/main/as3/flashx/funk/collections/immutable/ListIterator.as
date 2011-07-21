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

package flashx.funk.collections.immutable {
  import flashx.funk.IFunkObject
  import flashx.funk.collections.IIterator
  import flashx.funk.collections.IList
  import flashx.funk.collections.IteratorUtil
  import flashx.funk.collections.list
  import flashx.funk.collections.nil
  import flashx.funk.error.NoSuchElementError
  import flashx.funk.option.IOption
  import flashx.funk.option.none
  import flashx.funk.option.some

  /**
   * The ListIterator class is the companion iterator implementation
   * for the List class.
   * 
   * @private
   */
  internal final class ListIterator implements IIterator {
    private var _list: IList

    /**
     * Creates a new ListIterator object.
     * 
     * @private
     * @param list The backing list.
     */
    public function ListIterator(list: IList) {
      _list = list
    }

    /**
     * @inheritDoc
     */
    public function get hasNext(): Boolean {
      return _list.nonEmpty
    }

    /**
     * @inheritDoc
     */
    public function next(): * {
      if(_list == nil) {
        throw new NoSuchElementError()
      }

      const head: * = _list.head

      _list = _list.tail

      return head
    }

    /**
     * @inheritDoc
     */
    public function get nextOption(): IOption {
      if(list == nil) {
        return none
      } else {
        const head: * = _list.head

        _list = _list.tail

        return some(head)
      }
    }

    /**
     * @inheritDoc
     */
    public function equals(that: IFunkObject): Boolean {
      return IteratorUtil.eq(this, that)
    }

    /**
     * @inheritDoc
     */
    public function toString(): String {
      return "[ListIterator]"
    }

    /**
     * @inheritDoc
     */
    public function get toArray(): Array {
      return IteratorUtil.toArray(this)
    }

    /**
     * @inheritDoc
     */
    public function get toVector(): Vector.<*> {
      return IteratorUtil.toVector(this)
    }

    /**
     * @inheritDoc
     */
    public function get toList(): IList {
      return IteratorUtil.toList(this)
    }
  }
}