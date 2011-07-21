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
  import flashx.funk.IFunkObject;
  import flashx.funk.IImmutable;
  import flashx.funk.Product;
  import flashx.funk.collections.IIterable
  import flashx.funk.collections.IIterator
  import flashx.funk.collections.IList;
  import flashx.funk.collections.nil;
  import flashx.funk.collections.toList
  import flashx.funk.error.NoSuchElementError;
  import flashx.funk.option.IOption;
  import flashx.funk.option.none;
  import flashx.funk.option.some;
  import flashx.funk.tuple.ITuple2;
  import flashx.funk.tuple.tuple2;
  import flashx.funk.util.eq;
  import flashx.funk.util.require;
  import flashx.funk.util.verifiedType;

  public final class List extends Product implements IImmutable, IList {
    /**
     * Creates and returns a closure accepting a function to fill a list
     * with a defined amount of elements.
     *
     * @param n The size of the list.
     * @return A closure to populate the list.
     *
     * @example
     * <pre>
     *   List.fill(3)(function(): Sprite { return new Sprite })
     * </pre>
     */
    public static function fill(n: int): Function {
      return function(x: Function): IList {
        var l: IList = nil

        while(--n > -1) {
          l = l.prepend(x())
        }
        
        return l
      }
    }

    /**
     * Creates and returns a list based on a given array.
     *
     * @param array The array to transform to a list.
     * @return The List.&lt;A&gt; representation of a given Array.&lt;A&gt;.
     */
    public static function fromArray(array: Array): IList {
      var l: IList = nil
      var n: int = array.length

      while(--n > -1) {
        l = l.prepend(array[n])
      }

      return l
    }

    /**
     * Creates and returns a list based on a given string.
     *
     * @param string The string to transform to a list.
     * @return The List.&lt;String&gt; representation of a given string.
     */
    public static function fromString(string: String): IList {
      var l: IList = nil
      var n: int = string.length

      while(--n > -1) {
        l = l.prepend(string.substr(n, 1))
      }

      return l
    }

    /**
     * Creates and returns a list based on a given vector.
     *
     * @param vector The array to transform to a list.
     * @return The List.&lt;A&gt; representation of a given Vector.&lt;A&gt;
     */
    public static function fromVector(vector: Vector.<*>): IList {
      var l: IList = nil
      var n: int = vector.length

      while(--n > -1) {
        l = l.prepend(vector[n])
      }

      return l
    }

    /**
     * Private backing variable for the head property.
     * @private
     */
    private var _head: *

    /**
     * Private backing variable for the tail property.
     * @private
     */
    private var _tail: IList

    /**
     * Private backing variable for the length property.
     * @private
     */
    private var _length: int = 0

    /**
     * Whether or not the length has already been computed once.
     * @private
     */
    private var _lengthKnown: Boolean = false

    /**
     * Creates and returns a new List object.
     *
     * @param head The head of the list.
     * @param tail The tail of the list.
     */
    public function List(head: *, tail: IList) {
      _head = head
      _tail = tail
    }

    /**
     * @inheritDoc
     */
    [Deprecated(replacement="size", since="1.0")]
    public function get length(): int {
      return _lengthKnown ? _length : size
    }

    /**
     * @inheritDoc
     */
    public function get size(): int {
      if(_lengthKnown) {
        return _length
      }

      var p: IList = this
      var length: int = 0

      while(p.nonEmpty) {
        ++length;
        p = p.tail
      }

      _length = length
      _lengthKnown = true

      return length
    }

    /**
     * @inheritDoc
     */
    public function get hasDefinedSize(): Boolean {
      return true
    }

    /**
     * @inheritDoc
     */
    override public function equals(that: IFunkObject): Boolean {
      if (that is IList) {
        return super.equals(that)
      }

      return false
    }

    /**
     * @inheritDoc
     */
    override public function get productArity(): int {
      return size
    }

    /**
     * @inheritDoc
     */
    override public function productElement(i: int): * {
      validateIndex(i)

      var p: IList = this

      while(p.nonEmpty) {
        if(i == 0) {
          return p.head
        }

        p = p.tail
        i -= 1
      }

      throw new NoSuchElementError()
    }

    /**
     * @inheritDoc
     */
    override public function get productPrefix(): String {
      return "List"
    }

    /**
     * @inheritDoc
     */
    public function prepend(value: *): IList {
      return new List(value, this)
    }

    /**
     * @inheritDoc
     */
    public function prependAll(value: IList): IList {
      const n: int = value.size

      if(0 == n) {
        return this
      }

      const buffer: Vector.<List> = new Vector.<List>(n, true)
      const m: int = n - 1
      var p: IList = value
      var i: int, j: int

      i = 0

      while(p.nonEmpty) {
        buffer[i++] = new List(p.head, null)
        p = p.tail
      }

      buffer[m]._tail = this

      for(i = 0, j = 1; i < m; ++i, ++j) {
        buffer[i]._tail = buffer[j]
      }

      return buffer[0]
    }

    /**
     * @inheritDoc
     */
    public function get(i: int): * {
      return productElement(i)
    }

    /**
     * @inheritDoc
     */
    public function contains(value: *): Boolean {
      var p: IList = this

      while(p.nonEmpty) {
        if(eq(p.head, value)) {
          return true
        }
        p = p.tail
      }

      return false
    }

    /**
     * @inheritDoc
     */
    public function count(f: Function): int {
      var n: int = 0
      var p: IList = this

      while(p.nonEmpty) {
        if(f(p.head)) {
          ++n
        }

        p = p.tail
      }

      return n
    }

    /**
     * @inheritDoc
     */
    public function get nonEmpty(): Boolean {
      return true
    }

    /**
     * @inheritDoc
     */
    public function drop(n: int): IList {
      require(n >= 0, "n must be positive.")

      var p: IList = this

      for(var i: int = 0; i < n; ++i) {
        if(p.isEmpty) {
          return nil
        }

        p = p.tail
      }

      return p
    }

    /**
     * @inheritDoc
     */
    public function dropRight(n: int): IList {
      require(n >= 0, "n must be positive.")

      if(0 == n) {
        return this
      }
      
      n = size - n

      if(n <= 0) {
        return nil
      }

      const buffer: Vector.<List> = new Vector.<List>(n, true)
      const m: int = n - 1
      var p: IList = this
      var i: int, j: int

      for(i = 0; i < n; ++i) {
        buffer[i] = new List(p.head, null)
        p = p.tail
      }

      buffer[m]._tail = nil

      for(i = 0, j = 1; i < m; ++i, ++j) {
        buffer[i]._tail = buffer[j]
      }

      return buffer[0]
    }

    /**
     * @inheritDoc
     */
    public function dropWhile(f: Function): IList {
      var p: IList = this

      while(p.nonEmpty) {
        if(!f(p.head)) {
          return p
        }

        p = p.tail
      }

      return nil
    }

    /**
     * @inheritDoc
     */
    public function exists(f: Function): Boolean {
      var p: IList = this

      while(p.nonEmpty) {
        if(f(p.head)) {
          return true
        }

        p = p.tail
      }

      return false
    }

    /**
     * @inheritDoc
     */
    public function filter(f: Function): IList {
      var p: IList = this
      var q: List = null
      var first: List = null
      var last: List = null
      var allFiltered: Boolean = true;

      while(p.nonEmpty) {
        if(f(p.head)) {
          q = new List(p.head, nil)

          if(null != last) {
            last._tail = q
          }

          if(null == first) {
            first = q
          }

          last = q
        } else {
          allFiltered = false
        }

        p = p.tail
      }

      if(allFiltered) {
        return this
      }

      return (first == null) ? nil : first
    }

    /**
     * @inheritDoc
     */
    public function filterNot(f: Function): IList {
      var p: IList = this
      var q: List = null
      var first: List = null
      var last: List = null
      var allFiltered: Boolean = true;

      while(p.nonEmpty) {
        if(!f(p.head)) {
          q = new List(p.head, nil)

          if(null != last) {
            last._tail = q
          }

          if(null == first) {
            first = q
          }

          last = q
        } else {
          allFiltered = false
        }

        p = p.tail
      }

      if(allFiltered) {
        return this
      }

      return (first == null) ? nil : first
    }

    /**
     * @inheritDoc
     */
    public function find(f: Function): IOption {
      var p: IList = this

      while(p.nonEmpty) {
        if(f(p.head)) {
          return some(p.head)
        }

        p = p.tail
      }

      return none
    }

    /**
     * @inheritDoc
     */
    public function flatMap(f: Function): IList {
      var n: int = size
      const buffer: Vector.<IList> = new Vector.<IList>(n, true)
      var p: IList = this
      var i: int

      while(p.nonEmpty) {
        buffer[i++] = IList(verifiedType(f(p.head), IList))
        p = p.tail
      }

      var list: IList = buffer[--n]

      while(--n > -1) {
        list = list.prependAll(buffer[n])
      }

      return list
    }

    /**
     * @inheritDoc
     */
    public function foldLeft(x: *, f: Function): * {
      var value: * = x
      var p: IList = this

      while(p.nonEmpty) {
        value = f(value, p.head)
        p = p.tail
      }

      return value
    }

    /**
     * @inheritDoc
     */
    public function foldRight(x: *, f: Function): * {
      var value: * = x
      var buffer: Array = toArray
      var n: int = buffer.length

      while(--n > -1) {
        value = f(value, buffer[n])
      }

      return value
    }

    /**
     * @inheritDoc
     */
    public function forall(f: Function): Boolean {
      var p: IList = this

      while(p.nonEmpty) {
        if(!f(p.head)) {
          return false
        }

        p = p.tail
      }

      return true
    }

    /**
     * @inheritDoc
     */
    public function foreach(f: Function): void {
      var p: IList = this

      while(p.nonEmpty) {
        f(p.head)
        p = p.tail
      }
    }

    /**
     * @inheritDoc
     */
    public function get head(): * {
      return _head
    }

    /**
     * @inheritDoc
     */
    public function get headOption(): IOption {
      return some(_head)
    }

    /**
     * @inheritDoc
     */
    public function get indices(): IList {
      var n: int = size
      var p: IList = nil

      while(--n > -1) {
        p = p.prepend(n)
      }

      return p
    }

    /**
     * @inheritDoc
     */
    public function get init(): IList {
      return dropRight(1)
    }

    /**
     * @inheritDoc
     */
    public function get isEmpty(): Boolean {
      return false
    }

    /**
     * @inheritDoc
     */
    public function get last(): * {
      var p: IList = this
      var value: * = null
      while(p.nonEmpty) {
        value = p.head
        p = p.tail
      }

      return value
    }

    /**
     * @inheritDoc
     */
    public function map(f: Function): IList {
      const n: int = size
      const buffer: Vector.<List> = new Vector.<List>(n, true)
      const m: int = n - 1

      var p: IList = this
      var i: int, j: int

      for(i = 0; i < n; ++i) {
        buffer[i] = new List(f(p.head), null)
        p = p.tail
      }

      buffer[m]._tail = nil

      for(i = 0, j = 1; i < m; ++i, ++j) {
        buffer[i]._tail = buffer[j]
      }

      return buffer[0]
    }

    /**
     * @inheritDoc
     */
    public function partition(f: Function): ITuple2 {
      const left: Vector.<List> = new Vector.<List>()
      const right: Vector.<List> = new Vector.<List>()

      var i: int = 0
      var j: int = 0
      var m: int
      var o: int

      var p: IList = this

      while(p.nonEmpty) {
        if(f(p.head)) {
          left[i++] = new List(p.head, nil)
        } else {
          right[j++] = new List(p.head, nil)
        }

        p = p.tail
      }

      m = i - 1
      o = j - 1

      if(m > 0) {
        for(i = 0, j = 1; i < m; ++i, ++j) {
          left[i]._tail = left[j]
        }
      }

      if(o > 0) {
        for(i = 0, j = 1; i < o; ++i, ++j) {
          right[i]._tail = right[j]
        }
      }

      return tuple2(m > 0 ? left[0] : nil, o > 0 ? right[0] : nil)
    }

    /**
     * @inheritDoc
     */
    public function reduceLeft(f: Function): * {
      var value: * = head
      var p: IList = this._tail

      while(p.nonEmpty) {
        value = f(value, p.head)
        p = p.tail
      }

      return value
    }

    /**
     * @inheritDoc
     */
    public function reduceRight(f: Function): * {
      var buffer: Array = toArray
      var value: * = buffer.pop()
      var n: int = buffer.length

      while(--n > -1) {
        value = f(value, buffer[n])
      }

      return value
    }

    /**
     * @inheritDoc
     */
    public function get reverse(): IList {
      var result: IList = nil
      var p: IList = this

      while(p.nonEmpty) {
        result = result.prepend(p.head)
        p = p.tail
      }

      return result
    }

    /**
     * @inheritDoc
     */
    public function get tail(): IList {
      return _tail
    }

    /**
     * @inheritDoc
     */
    public function get tailOption(): IOption {
      return some(_tail)
    }

    /**
     * @inheritDoc
     */
    public function take(n: int): IList {
      require(n >= 0, "n must be positive.")

      if(n > size) {
        return this
      } else if(0 == n) {
        return nil
      }

      const buffer: Vector.<List> = new Vector.<List>(n, true)
      const m: int = n - 1
      var p: IList = this
      var i: int, j: int

      for(i = 0; i < n; ++i) {
        buffer[i] = new List(p.head, null)
        p = p.tail
      }

      buffer[m]._tail = nil

      for(i = 0, j = 1; i < m; ++i, ++j) {
        buffer[i]._tail = buffer[j]
      }

      return buffer[0]
    }

    /**
     * @inheritDoc
     */
    public function takeRight(n: int): IList  {
      require(n >= 0, "n must be positive.")

      if(n > size) {
        return this
      } else if(0 == n) {
        return nil
      }

      n = size - n

      if(n <= 0) {
        return this
      }

      var p: IList = this

      for(var i: int = 0; i < n; ++i) {
        p = p.tail
      }

      return p
    }

    /**
     * @inheritDoc
     */
    public function takeWhile(f: Function): IList {
      const buffer: Vector.<List> = new Vector.<List>()
      var p: IList = this
      var i: int, j: int
      var n: int = 0

      while(p.nonEmpty) {
        if(f(p)) {
          buffer[n++] = new List(p.head, null)
          p = p.tail
        } else {
          break
        }
      }

      const m: int = n - 1

      if(m <= 0) {
        return nil
      }
      
      buffer[m]._tail = nil

      for(i = 0, j = 1; i < m; ++i, ++j) {
        buffer[i]._tail = buffer[j]
      }

      return buffer[0]
    }

    /**
     * @inheritDoc
     */
    public function get toArray(): Array {
      const n: int = size
      const array: Array = new Array(n)
      var p: IList = this
      var i: int

      for(i = 0; i < n; ++i) {
        array[i] = p.head
        p = p.tail
      }

      return array
    }

    /**
     * @inheritDoc
     */
    public function get toVector(): Vector.<*> { return createVector(false) }

    /**
     * @inheritDoc
     */
    public function get toFixedVector(): Vector.<*> { return createVector(true) }

    /**
     * @inheritDoc
     */
    public function zip(that: IList): IList {
      const n: int = Math.min(size, that.size)
      const m: int = n - 1
      const buffer: Vector.<List> = new Vector.<List>(n, true)
      var i: int, j: int

      var p: IList = this, q: IList = that

      for(i = 0; i < n; ++i) {
        buffer[i] = new List(tuple2(p.head, q.head), null)
        p = p.tail
        q = q.tail
      }

      buffer[m]._tail = nil

      for(i = 0, j = 1; i < m; ++i, ++j) {
        buffer[i]._tail = buffer[j]
      }

      return buffer[0]
    }

    /**
     * @inheritDoc
     */
    public function get zipWithIndex(): IList {
      const n: int = size
      const m: int = n - 1
      const buffer: Vector.<List> = new Vector.<List>(n, true)
      var i: int, j: int

      var p: IList = this

      for(i = 0; i < n; ++i) {
        buffer[i] = new List(tuple2(p.head, i), null)
        p = p.tail
      }

      buffer[m]._tail = nil

      for(i = 0, j = 1; i < m; ++i, ++j) {
        buffer[i]._tail = buffer[j]
      }

      return buffer[0]
    }

    /**
     * Creates and returns a new Vector.<*> containing all elements
     * of the list while preserving order.
     *
     * @param fixed Whether or not the vector is fixed.
     * @return A Vector.<*> containing all elements of the list.
     */
    private function createVector(fixed: Boolean): Vector.<*> {
      const n: int = size
      const vector: Vector.<*> = new Vector.<*>(n, fixed)
      var p: IList = this
      var i: int

      for(i = 0; i < n; ++i) {
        vector[i] = p.head
        p = p.tail
      }

      return vector
    }

    /**
     * @inheritDoc
     */
    public function findIndexOf(f:Function):int {
      var index: int = 0
      var p: IList = this

      while(p.nonEmpty) {
        if(f(p.head)) {
          return index
        }

        p = p.tail
        index += 1
      }

      return -1
    }

    /**
     * @inheritDoc
     */
    public function get flatten(): IList {
      return flatMap(function(x: *): IList { return x is IList ? x : toList(x) })
    }

    /**
     * @inheritDoc
     */
    public function indexOf(value:*):int {
      var index: int = 0
      var p: IList = this

      while(p.nonEmpty) {
        if(eq(p.head, value)) {
          return index
        }

        p = p.tail
        index += 1
      }

      return -1
    }

    /**
     * @inheritDoc
     */
    override public function mkString(separator: String): String {
      const n: int = size
      const m: int = n - 1

      var buffer: String = ""
      var p: IList = this
      var i: int

      for(i = 0; i < n; ++i) {
        buffer += p.head

        if(i != m) {
          buffer += separator
        }

        p = p.tail
      }

      return buffer
    }

    /**
     * @inheritDoc
     */
    override public function get iterator(): IIterator {
      return new ListIterator(this)
    }

    /**
     * @inheritDoc
     */
    public function append(value: *): IList {
      const n: int = size
      const buffer: Vector.<List> = new Vector.<List>(n+1, true)
      var p: IList = this
      var i: int, j: int

      i = 0

      while(p.nonEmpty) {
        buffer[i++] = new List(p.head, null)
        p = p.tail
      }

      buffer[n] = new List(value, nil)

      for(i = 0, j = 1; i < n; ++i, ++j) {
        buffer[i]._tail = buffer[j]
      }

      return buffer[0]
    }

    /**
     * @inheritDoc
     */
    public function appendAll(value: IList): IList {
      const n: int = size
      const m: int = n - 1
      const buffer: Vector.<List> = new Vector.<List>(n, true)
      var p: IList = this
      var i: int, j: int

      i = 0

      while(p.nonEmpty) {
        buffer[i++] = new List(p.head, null)
        p = p.tail
      }

      buffer[m]._tail = value

      for(i = 0, j = 1; i < m; ++i, ++j) {
        buffer[i]._tail = buffer[j]
      }

      return buffer[0]
    }

    /**
     * @inheritDoc
     */
    public function prependIterator(iterator: IIterator): IList {
      return prependAll(iterator.toList)
    }

    /**
     * @inheritDoc
     */
    public function appendIterator(iterator: IIterator): IList {
      return appendAll(iterator.toList)
    }

    /**
     * @inheritDoc
     */
    public function prependIterable(iterable: IIterable): IList {
      return prependAll(iterable.iterator.toList)
    }

    /**
     * @inheritDoc
     */
    public function appendIterable(iterable: IIterable): IList {
      return appendAll(iterable.iterator.toList)
    }
  }
}