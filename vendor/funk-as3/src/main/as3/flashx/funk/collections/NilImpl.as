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
  import flashx.funk.IImmutable
  import flashx.funk.Product
  import flashx.funk.collections.immutable.List
  import flashx.funk.error.NoSuchElementError
  import flashx.funk.option.IOption
  import flashx.funk.option.none
  import flashx.funk.tuple.ITuple2
  import flashx.funk.tuple.tuple2
  import flashx.funk.util.require

  internal final class NilImpl extends Product implements IImmutable, IList {
    /**
     * @inheritDoc
     */
    public function contains(value: *): Boolean {
      return false
    }

    /**
     * @inheritDoc
     */
    public function count(f: Function): int {
      return 0
    }

    /**
     * @inheritDoc
     */
    public function get nonEmpty(): Boolean {
      return false
    }

    /**
     * @inheritDoc
     */
    public function drop(n: int): IList {
      require(n >= 0, "n must be positive.")
      return this
    }

    /**
     * @inheritDoc
     */
    public function dropRight(n: int): IList {
      require(n >= 0, "n must be positive.")
      return this
    }

    /**
     * @inheritDoc
     */
    public function dropWhile(f: Function): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function exists(f: Function): Boolean {
      return false
    }

    /**
     * @inheritDoc
     */
    public function filter(f: Function): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function filterNot(f: Function): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function find(f: Function): IOption {
      return none
    }

    /**
     * @inheritDoc
     */
    public function flatMap(f: Function): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function foldLeft(x: *, f: Function): * {
      return x
    }

    /**
     * @inheritDoc
     */
    public function foldRight(x: *, f: Function): * {
      return x
    }

    /**
     * @inheritDoc
     */
    public function forall(f: Function): Boolean {
      return false
    }

    /**
     * @inheritDoc
     */
    public function foreach(f: Function): void {
    }

    /**
     * @inheritDoc
     */
    public function get (index: int): * {
      throw new RangeError()
    }

    /**
     * @inheritDoc
     */
    public function get head(): * {
      throw new NoSuchElementError()
    }

    /**
     * @inheritDoc
     */
    public function get headOption(): IOption {
      return none
    }

    /**
     * @inheritDoc
     */
    public function get indices(): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function get init(): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function get isEmpty(): Boolean {
      return true
    }

    /**
     * @inheritDoc
     */
    public function get last(): * {
      throw new NoSuchElementError()
    }

    /**
     * @inheritDoc
     */
    public function map(f: Function): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function partition(f: Function): ITuple2 {
      return tuple2(this, this)
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
      return value
    }

    /**
     * @inheritDoc
     */
    public function reduceLeft(f: Function): * {
      return undefined
    }

    /**
     * @inheritDoc
     */
    public function reduceRight(f: Function): * {
      return undefined
    }

    /**
     * @inheritDoc
     */
    public function get reverse(): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function get tail(): IList {
      throw new NoSuchElementError()
    }

    /**
     * @inheritDoc
     */
    public function get tailOption(): IOption {
      return none
    }

    /**
     * @inheritDoc
     */
    public function take(n: int): IList {
      require(n >= 0, "n must be positive.")
      return this
    }

    /**
     * @inheritDoc
     */
    public function takeRight(n: int): IList {
      require(n >= 0, "n must be positive.")
      return this
    }

    /**
     * @inheritDoc
     */
    public function takeWhile(f: Function): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function zip(that: IList): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function get zipWithIndex(): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function get size(): int {
      return 0
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
    public function get toArray(): Array {
      return []
    }

    /**
     * @inheritDoc
     */
    public function get toVector(): Vector.<*> {
      return new Vector.<*>()
    }

    /**
     * @inheritDoc
     */
    public function get toFixedVector(): Vector.<*> {
      return new Vector.<*>(0, true)
    }

    /**
     * @inheritDoc
     */
    public function findIndexOf(f: Function): int {
      return -1
    }

    /**
     * @inheritDoc
     */
    public function get flatten(): IList {
      return this
    }

    /**
     * @inheritDoc
     */
    public function indexOf(value: *): int {
      return -1
    }

    /**
     * @inheritDoc
     */
    override public function get productArity(): int {
      return 0
    }

    /**
     * @inheritDoc
     */
    override public function productElement(i: int): * {
      throw new RangeError()
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
    override public function toString(): String {
      return "List()"
    }

    /**
     * @inheritDoc
     */
    override public function mkString(separator: String): String {
      return ""
    }

    /**
     * @inheritDoc
     */
    [Deprecated(replacement="size", since="1.0")]
    public function get length(): int {
      return 0
    }

    /**
     * @inheritDoc
     */
    public function prependIterator(iterator: IIterator): IList {
      return iterator.toList
    }

    /**
     * @inheritDoc
     */
    public function prependIterable(iterable: IIterable): IList {
      return iterable.iterator.toList
    }

    /**
     * @inheritDoc
     */
    public function append(value: *): IList {
      return new List(value, this)
    }

    /**
     * @inheritDoc
     */
    public function appendAll(value: IList): IList {
      return value
    }

    /**
     * @inheritDoc
     */
    public function appendIterator(iterator: IIterator): IList {
      return iterator.toList
    }

    /**
     * @inheritDoc
     */
    public function appendIterable(iterable: IIterable): IList {
      return iterable.iterator.toList
    }

    /**
     * @inheritDoc
     */
    override public function get iterator(): IIterator {
      return NilIterator.INSTANCE
    }
  }
}