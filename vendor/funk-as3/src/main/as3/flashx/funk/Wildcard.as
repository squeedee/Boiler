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

package flashx.funk {
  import flash.utils.Proxy
  import flash.utils.flash_proxy

  import flashx.funk.util.eq
  import flashx.funk.util.ne

  /**
   * The Wildcard class represents an instance of &quot;_&quot;.
   * 
   * @author Joa Ebert
   */
  internal final dynamic class Wildcard extends Proxy {
    /**
     * @inheritDoc
     */
    flash_proxy override function callProperty(name: *, ... args): * {
      return function(x: *): * {
        return x[name].apply(x, args)
      }
    }

    /**
     * @inheritDoc
     */
    flash_proxy override function getProperty(name: *): * {
      return function(x: *): * {
        return x[name]
      }
    }

    /**
     * The function <code>f</code> with <code>f(x) = ~x</code>.
     */
    public const binaryNot: Function = function(x: *): * {
      return ~x
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = x - y</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = x - y</code>.
     */
    public function decrementBy(value: Number): Function {
      return function(x: Number): Number {
        return x - value
      }
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = x / y</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = x / y</code>.
     */
    public function divideBy(value: Number): Function {
      return function(x: Number): Number {
        return x / value
      }
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = eq(x, y)</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = eq(x, y)</code>.
     */
    public function equals(value: *): Function {
      return function(x: *): Boolean{
        return eq(x, value)
      }
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = x.y</code>.
     *
     * @param property The property <code>y</code> of <code>x</code>.
     * @return The function <code>f</code> with <code>f(x) = x.y</code>.
     */
    public function get(property: String): Function {
      return function(x: *): * {
        return x[property]
      }
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = x >= y</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = x >= y</code>.
     */
    public function greaterEqual(value: *): Function {
      return function(x: *): Boolean {
        return x >= value
      }
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = x > y</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = x > y</code>.
     */
    public function greaterThan(value: *): Function {
      return function(x: *): Boolean {
        return x > value
      }
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = x + y</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = x + y</code>.
     */
    public function incrementBy(value: Number): Function {
      return function(x: Number): Number {
        return x + value
      }
    }

    /**
     * Creates and returns the function <code>f</code> to test if <code>x</code>
     * is in [minValue, maxValue].
     *
     * @param minValue The inclusive start of the range.
     * @param maxValue The inclusive end of the range.
     * @return The function <code>f</code> to test if <code>x</code>
     * is in [minValue, maxValue].
     */
    public function inRange(minValue: Number, maxValue: Number): Function {
      return function(x: *): Boolean {
        return minValue <= x && x <= maxValue
      }
    }

    /**
     * The function <code>f</code> with <code>f(x) = x % 2 == 0</code>.
     */
    public const isEven: Function = function(x: Number): Boolean {
      const asInt: int = int(x)

      if(0 != (x - asInt)) {
        return false
      }

      return (asInt & 1) == 0
    }

    /**
     * The function <code>f</code> with <code>f(x) = x % 2 != 0</code>.
     */
    public const isOdd: Function = function(x: Number): Boolean {
      const asInt: int = int(x)

      if(0 != (x - asInt)) {
        return false
      }

      return (asInt & 1) != 0
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = x <= y</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = x <= y</code>.
     */
    public function lessEqual(value: *): Function {
      return function(x: *): Boolean {
        return x <= value
      }
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = x < y</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = x < y</code>.
     */
    public function lessThan(value: *): Function {
      return function(x: *): Boolean {
        return x < value
      }
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = x % y</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = x % y</code>.
     */
    public function moduloBy(value: Number): Function {
      return function(x: Number): Number {
        return x % value
      }
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = x ~~ y</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = x ~~ y</code>.
     */
    public function multiplyBy(value: Number): Function {
      return function(x: Number): Number {
        return x * value
      }
    }

    /**
     * The function <code>f</code> with <code>f(x) = !x</code>.
     */
    public const not: Function = function(x: *): Boolean {
      return !x
    }

    /**
     * Creates and returns the function <code>f</code> with <code>f(x) = ne(x, y)</code>.
     *
     * @param value The value for <code>y</code>.
     * @return The function <code>f</code> with <code>f(x) = ne(x, y)</code>.
     */
    public function notEquals(value: *): Function {
      return function(x: *): Boolean{
        return ne(x, value)
      }
    }

    /**
     * The function <code>f</code> with <code>f(x) = x ? true : false</code>.
     */
    public const toBoolean: Function = function(x: *): Boolean {
      return x ? true : false
    }

    /**
     * The function <code>f</code> with <code>f(x) = x.toLowerCase()</code>.
     */
    public const toLowerCase: Function = function(x: *): String {
      return x is String ? String(x).toLowerCase() : ("" + x).toLowerCase()
    }

    /**
     * The function <code>f</code> with <code>f(x) = x.toString()</code>.
     */
    public const toString: Function = function(x: *): String {
      return "" + x
    }

    /**
     * The function <code>f</code> with <code>f(x) = x.toUpperCase()</code>.
     */
    public const toUpperCase: Function = function(x: *): String {
      return x is String ? String(x).toUpperCase() : ("" + x).toUpperCase()
    }
    
    /**
     * The function <code>f</code> with <code>f(x) = toList(x)</code>.
     */
    public const toList: Function = function(x: *): String {
      return toList(x)
    }

    /**
     * The function <code>f</code> with <code>f(x, y) = x + y</code>.
     */
    public const plus_: Function = function(a: *, b: *): * { return a + b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x - y</code>.
     */
    public const minus_: Function = function(a: *, b: *): * { return a - b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x ~~ y</code>.
     */
    public const multiply_: Function = function(a: *, b: *): * { return a * b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x / y</code>.
     */
    public const divide_: Function = function(a: *, b: *): * { return a / b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x % y</code>.
     */
    public const modulo_: Function = function(a: *, b: *): * { return a % b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x < y</code>.
     */
    public const lessThan_: Function = function(a: *, b: *): * { return a < b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x > y</code>.
     */
    public const greaterThan_: Function = function(a: *, b: *): * { return a > b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x >= y</code>.
     */
    public const greaterEqual_: Function = function(a: *, b: *): * { return a >= b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x <= y</code>.
     */
    public const lessEqual_: Function = function(a: *, b: *): * { return a <= b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x == y</code>.
     */
    public const equal_: Function = function(a: *, b: *): * { return eq(a, b) }

    /**
     * The function <code>f</code> with <code>f(x, y) = x != y</code>.
     */
    public const notEqual_: Function = function(a: *, b: *): * { return ne(a, b)}

    /**
     * The function <code>f</code> with <code>f(x, y) = x === y</code>.
     */
    public const strictlyEqual_: Function = function(a: *, b: *): * { return a == b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x !== y</code>.
     */
    public const strictlyNotEqual_: Function = function(a: *, b: *): * { return a !== b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x & y</code>.
     */
    public const binaryAnd_: Function = function(a: *, b: *): * { return a & b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x | y</code>.
     */
    public const binaryOr_: Function = function(a: *, b: *): * { return a | b }

    /**
     * The function <code>f</code> with <code>f(x, y) = x ^ y</code>.
     */
    public const binaryXor_: Function = function(a: *, b: *): * { return a ^ b }

    public function Wildcard() {}
  }
}