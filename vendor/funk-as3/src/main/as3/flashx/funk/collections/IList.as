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
  import flashx.funk.IProduct;
  import flashx.funk.option.IOption;
  import flashx.funk.tuple.ITuple2;

  public interface IList extends IProduct, ICollection {
		/**
		 * Tests whether or not the list contains the given element.
		 *
		 * The equality test is done by value comparison. That means
		 * <code>list.contains(some(1))</code> is true for any <code>list(some(1))</code>.
		 *
		 * @param value The item to search for.
		 * @return <code>true</code> if the list contains an equal element; <code>false</code> otherwise.
		 */
    function contains(value: *): Boolean

    /**
     * Calculates and returns the number of elements that fulfill the given predicate.
		 *
     * @param f The predicate <code>A → Boolean</code>
     * @return The number of items that fulfill the predicate <code>f</code>.
     */
    function count(f: Function): int

		/**
		 * Whether or not the list is populated.
		 */
    function get nonEmpty(): Boolean

		/**
		 * Drop <code>n</code> elements form the list and return the suffix.
		 *
		 * @param n The number of elements to drop.
		 * @return The resulting suffix of type IList.&lt;A&gt;.
		 */
    function drop(n: int): IList

		/**
		 * Drop <code>n</code> elements from the list and return the prefix.
		 *
		 * @param n The number of elements to drop.
		 * @return The resulting prefix of type IList.&lt;A&gt;.
		 */
    function dropRight(n: int): IList

    /**
     * Drop the longest prefix fulfilling predicate <code>f</code> from the list and return the suffix.
		 *
     * @param f The predicate <code>A → Boolean</code>
     * @return The resulting suffix of type IList.&lt;A&gt;
     */
    function dropWhile(f: Function): IList

    /**
     * Test whether or not at least one element fulfills the given predicate <code>f</code>.
		 *
     * @param f The predicate <code>A → Boolean</code>
     * @return <code>true</code> if any element fulfills the predicate <code>f</code>; <code>false</code> otherwise.
     */
    function exists(f: Function): Boolean

    /**
     * Filter and return all elements that fulfill <code>f</code>.
		 *
     * @param f The predicate <code>A → Boolean</code>
     * @return A list IList.&lt;A&gt; of all elements that fulfill the predicate <code>f</code>
     */
    function filter(f: Function): IList

		/**
     * Filter and return all elements that do not fulfill <code>f</code>.
		 *
     * @param f The predicate <code>A → Boolean</code>
     * @return A list IList.&lt;A&gt; of all elements that do not fulfill the predicate <code>f</code>
     */
    function filterNot(f: Function): IList

    /**
     * Search and return the first element that fulfills <code>f</code>.
		 *
     * @param f The predicate <code>A → Boolean</code>
     * @return An IOption.&lt;A&gt; that contains the element.
     */
    function find(f: Function): IOption

    /**
     * Find and return the index of the first element that fulfills <code>f</code>.
		 *
     * @param f The predicate <code>A → Boolean</code>
     * @return The index of the first element fulfilling <code>f</code>; -1 if no such element exists.
     */
    function findIndexOf(f: Function): int

    /**
     * Map over the list and flatten the result.
		 *
		 * @throws TypeError If <code>f</code> does not return an object of type IList.&lt;B&gt;
     * @param f The mapping <code>A → IList.&lt;B&gt;</code>
     * @return The flattened result of type IList.&lt;B&gt;
     */
    function flatMap(f: Function): IList

		/**
		 * A flat representation of the list.
		 */
    function get flatten(): IList

    /**
     * Fold the list with the initial value <code>x</code> from the left.
		 *
     * @param x The initial value of type <code>B</code>.
     * @param f The fold operator of type <code>A, A → B</code>.
     * @return The resulting value of type <code>B</code>.
     */
    function foldLeft(x: *, f: Function): *

    /**
     * Fold the list with the initial value <code>x</code> from the right.
		 *
     * @param x The initial value of type <code>B</code>.
     * @param f The fold operator of type <code>A, A → B</code>.
     * @return The resulting value of type <code>B</code>.
     */
    function foldRight(x: *, f: Function): *

    /**
     * Test whether or not all elements of the list fulfil <code>f</code>.
		 *
     * @param f The predicate <code>A → Boolean</code>
     * @return <code>true</code> if all element fulfill the predicate <code>f</code>; <code>false</code> otherwise.
     */
    function forall(f: Function): Boolean

    /**
     * Call <code>f</code> for each element in the list.
		 *
     * @param f A function of type <code>A → void</code>
     */
    function foreach(f: Function): void

		/**
		 * Return the element at the specified index.
		 *
		 * @param index The index of the element.
		 * @throws RangeError A range error is thrown if the index is out of bounds.
		 * @return An element of type <code>A</code>.
		 */
    function get(index: int): *

		/**
		 * The head element of the list.
		 *
		 * @throws flashx.funk.error.NoSuchElementError If the list is empty.
		 */
    function get head(): *

		/**
		 * The head option of the list; <code>none</code> if the list is empty.
		 */
    function get headOption(): IOption

		/**
     * Find and return the index of the first element equal to the given value.
		 *
		 * The equality test is done by value comparison; not by reference.
		 *
     * @param value The element to search for
     * @return The index of the first element equal to <code>value</code>; -1 if no such element exists.
     */
    function indexOf(value: *): int

		/**
		 * An IList.&lt;int&gt; that contains of the indices of the current list.
		 */
    function get indices(): IList

		/**
		 * The IList.&lt;A&gt; without its rightmost element.
		 */
    function get init(): IList

		/**
		 * Whether or not is equal to <code>nil</code>.
		 */
    function get isEmpty(): Boolean

		/**
		 * The rightmost element of the list.
		 * @throws flashx.funk.error.NoSuchElementError If the list is empty.
		 */
    function get last(): *

    /**
     * Map over the list and return the result.
		 *
     * @param f The mapping <code>A → B</code>
		 * @return The mapped list of type IList.&lt;B&gt;.
     */
    function map(f: Function): IList

		/**
		 * Partitions the list by a predicate <code>f</code> and returns a tuple as the result.
		 *
		 * @param f The predicate <code>A → Boolean</code>.
		 * @return A tuple <code>x</code> of (IList.&lt;A&gt;, IList.&lt;A&gt;) with <code>x<sub>1</sub></code> containing all elements that fulfill <code>f</code> and <code>x<sub>2</sub></code> containing all elements that did not match <code>f</code>.
		 */
    function partition(f: Function): ITuple2

		/**
		 * Prepend an element to the list.
		 *
		 * Use this method to build a list. Lists are always built in reverse because it requires O(1) time.
		 * If you have trouble getting your elements in reverse you can also build 
		 * @param value The element to prepend.
		 * @return The resulting List.&lt;A&gt;
		 * @example
		 * <pre>
		 *   list(1,2,3).equals(nil.prepend(3).prepend(2).prepend(1))
		 * </pre>
		 */
    function prepend(value: *): IList

    function prependAll(value: IList): IList

    function prependIterator(iterator: IIterator): IList

    function prependIterable(iterable: IIterable): IList

    function append(value: *): IList

    function appendAll(value: IList): IList
    
    function appendIterator(iterator: IIterator): IList

    function appendIterable(iterable: IIterable): IList

    /**
     *
     * @param f (A, A) =&gt; B
     * @return B
     */
    function reduceLeft(f: Function): *

    /**
     *
     * @param f (A, A) =&gt; B
     * @return B
     */
    function reduceRight(f: Function): *

    function get reverse(): IList

    function get tail(): IList

    function get tailOption(): IOption

    function take(n: int): IList

    function takeRight(n: int): IList

    /**
     *
     * @param f A =&gt; Boolean
     * @return list.&lt;A&gt;
     */
    function takeWhile(f: Function): IList

    function zip(that: IList): IList

    function get zipWithIndex(): IList
  }
}