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

package flashx.funk.option {
	import flashx.funk.IProduct;

  /**
   * The IOption.&lt;A&gt; interface defines the option type.
   *
   * Note please that <code>IOption.&lt;A&gt;</code> is only pseudo code. The
   * type <code>A</code> is the type of the value stored within the option.
   * Sometimes you will also see a type <code>B</code> which could be a
   * resulting type.
   *
   * The <code>map</code> method for instance has the signature
   * <code>IOption.&lt;A&gt; map.&lt;B&gt;(f: A → B): IOption.&lt;B&gt;</code>. This
   * means that <code>map</code> accepts a function <code>f</code> which accepts one
   * parameter of type <code>A</code> and results in a value of type <code>B</code>. So
   * the result is an IOption.&lt;B&gt;.
   *
   * @example
   * <pre>
   *  some("1").map(function(x: String): int { return parseInt(x) })
   * </pre>
   *
   */
	public interface IOption extends IProduct {
    /**
     * The value of the option.
     * 
     * @throws flashx.funk.error.NoSuchElementError If the option is not defined.
     */
    function get get(): */*A*/

    /**
     * Returns the value of the option or an alternative if not defined.
     *
     * @param f The alternative of type <code>→ A</code>.
     * @return The value of the option or its alternative.
     */
    function getOrElse(f: Function/*.<→ A>*/): */*A*/

    /**
     * Whether or not the option is defined.
     */
    function get isDefined(): Boolean

    /**
     * Whether or not the option is undefined.
     */
    function get isEmpty(): Boolean

    /**
     * Filter over the option.
     *
     * @param f The predicate <code>A → Boolean</code>
     * @return An Option.&lt;A&gt; that is defined if the predicate was true.
     */
    function filter(f: Function/*.<A → Boolean>*/): IOption/*.<A>*/

    /**
     * Apply the function <code>f</code> to the value of the option if defined.
     *
     * @param f The function <code>A → void</code>
     */
    function foreach(f: Function/*.<A →>*/): void

    /**
     * Map over the option and flatten the result.
     *
     * @param f The mapping <code>A → IOption.&lt;B&gt;</code>
     * @throws TypeError If the mapping <code>f</code> does not return an <code>IOption.&lt;B&gt;</code>
     * @return The resulting Option.&lt;B&gt;
     */
    function flatMap/*.<B>*/(f: Function/*.<A → IOption.<B>>*/): IOption/*.<B>*/
    
    /**
     * Map over the option.
     *
     * The map method will map a value only if the option is defined.
     *
     * This means that if you have <code>some("1").map(function(x: String): int { return parseInt(x) })</code>
     * the result will be an <code>IOption.&lt;int&gt;</code> with the integer value <code>1</code>.
     * <code>none.map(function(x: String) { ... })</code> would result in an IOption.&lt;int&gt; that is undefined.
     *
     * @param f The mapping <code>A → B</code>
     * @return The resulting <code>Option.&lt;B&gt;</code>.
     */
    function map/*.<B>*/(f: Function/*.<A → B>*/): IOption/*.<B>*/

    /**
     * Return the option itself or an alternative option.
     * 
     * @param f The alternative of type <code>→ Option.&lt;A&gt;</code>.
     * @return The resulting <code>Option.&lt;A&gt;</code>.
     */
    function orElse(f: Function/*.<→ A>*/): IOption/*.<A>*/
  }
}