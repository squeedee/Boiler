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
  import flashx.funk.collections.Range
  import flashx.funk.collections.list
  import flashx.funk.option.some

  import flexunit.framework.TestCase

  public final class Test_ extends TestCase {
    public function testBinaryNot(): void {
      assertEquals(~1234, _.binaryNot(1234))
    }

    public function testDecrementBy(): void {
      assertEquals(1, _.decrementBy(1)(2))
      assertEquals(0, _.decrementBy(2)(2))
      assertEquals(-1, _.decrementBy(3)(2))
      assertEquals(3, _.decrementBy(-1)(2))
    }

    public function testDivideBy(): void {
      const n: int = 10
      Range.until(1, n).foreach(function(i: int): void {
        assertEquals(1, _.divideBy(i)(i))
      })

      Range.until(1, n+1).foreach(function(i: int): void {
        assertEquals(1, _.divideBy(i)(i))
      })

      assertEquals(-1, _.divideBy(-3)(3))
      assertEquals(2.5, _.divideBy(2)(5))
    }

    public function testEquals(): void {
      const a: int = 1
      const b: int = 1
      assertFalse(_.equals({})({}))
      assertTrue(_.equals(a)(b))
      assertTrue(_.equals(b)(a))
      assertTrue(_.equals(some(a))(some(b)))
      assertTrue(_.equals(some(b))(some(a)))
    }

    public function testGet(): void {
      const a: Object = { property: 1 }
      assertEquals(1, _.get("property")(a))
      assertUndefined(_.get("unknown")(a))
    }

    public function testImplicitGet(): void {
      const a: Object = { property: 1 }
      assertEquals(1, (_.property)(a))
      assertUndefined((_.unknown)(a))
    }

    public function testImplicitCall(): void {
      const a: Object = { callMe: function(p0: int,  p1: int): int { return p0 + p1 } }
      assertEquals(3, _.callMe(1,2)(a))
    }

    public function testGreaterEqual(): void {
      assertTrue(_.greaterEqual(5)(6))
      assertTrue(_.greaterEqual(5)(5))
      assertFalse(_.greaterEqual(5)(4))
    }

    public function testGreaterThan(): void {
      assertTrue(_.greaterThan(5)(6))
      assertFalse(_.greaterThan(5)(5))
      assertFalse(_.greaterThan(5)(4))
    }

    public function testIncrementBy(): void {
      assertEquals(3, _.incrementBy(1)(2))
      assertEquals(4, _.incrementBy(2)(2))
      assertEquals(2, _.incrementBy(3)(-1))
      assertEquals(1, _.incrementBy(-1)(2))
    }

    public function testInRange(): void {
      assertTrue(_.inRange(0, 10)(0))
      assertTrue(_.inRange(0, 10)(10))
      assertFalse(_.inRange(0, 10)(11))
      assertFalse(_.inRange(0, 10)(-1))
    }

    public function testIsEven(): void {
      assertTrue(_.isEven(2))
      assertFalse(_.isEven(1))
      assertTrue(list(2,4,6,8,10).equals(Range.to(1,10).filter(_.isEven)))
    }

    public function testIsOdd(): void {
      assertFalse(_.isOdd(2))
      assertTrue(_.isOdd(1))
      assertTrue(list(1,3,5,7,9).equals(Range.to(1,10).filter(_.isOdd)))
    }

    public function testLessEqual(): void {
      assertFalse(_.lessEqual(5)(6))
      assertTrue(_.lessEqual(5)(5))
      assertTrue(_.lessEqual(5)(4))
    }

    public function testLessThan(): void {
      assertFalse(_.lessThan(5)(6))
      assertFalse(_.lessThan(5)(5))
      assertTrue(_.lessThan(5)(4))
    }

    public function testMouloBy(): void {
      assertEquals(1, _.moduloBy(4)(5))
      assertEquals(0, _.moduloBy(4)(4))
    }

    public function testMultiplyBy(): void {
      assertEquals(5, _.multiplyBy(1)(5))
      assertEquals(8, _.multiplyBy(2)(4))
      assertEquals(2, _.multiplyBy(0.5)(4))
    }

    public function testNot(): void {
      assertFalse(_.not(true))
      assertTrue(_.not(false))
    }

    public function testNotEquals(): void {
      const a: int = 1
      const b: int = 1
      assertTrue(_.notEquals({})({}))
      assertFalse(_.notEquals(a)(b))
      assertFalse(_.notEquals(b)(a))
      assertFalse(_.notEquals(some(a))(some(b)))
      assertFalse(_.notEquals(some(b))(some(a)))
    }

    public function testToBoolean(): void {
      assertTrue(_.toBoolean(true))
      assertFalse(_.toBoolean(false))
      assertTrue(_.toBoolean(1))
      assertFalse(_.toBoolean(0))
      assertTrue(_.toBoolean("."))
      assertFalse(_.toBoolean(null))
      assertTrue(_.toBoolean({}))
    }

    public function testToLowerCase(): void {
      assertEquals("null", _.toLowerCase(null))
      assertEquals("undefined", _.toLowerCase(undefined))
      assertEquals("test", _.toLowerCase("TEST"))
    }

    public function testToString(): void {
      assertEquals("null", _.toString(null))
      assertEquals("undefined", _.toString(undefined))
      assertEquals("test", _.toString("test"))
    }

    public function testToUpperCase(): void {
      assertEquals("NULL", _.toUpperCase(null))
      assertEquals("UNDEFINED", _.toUpperCase(undefined))
      assertEquals("TEST", _.toUpperCase("test"))
    }

    public function testPlus_(): void {
      assertEquals(5050, Range.to(1, 100).reduceLeft(_.plus_))
    }

    public function testMinus_(): void {
      assertEquals(-5048, Range.to(1, 100).reduceLeft(_.minus_))
    }

    public function testMultiply_(): void {
      assertEquals(2 * 3 * 4 * 5, Range.to(1, 5).reduceLeft(_.multiply_))
    }

    public function testDivide_(): void {
      assertEquals(1 / 2 / 3 / 4 / 5, Range.to(1, 5).reduceLeft(_.divide_))
    }

    public function testModulo_(): void {
      assertEquals(1 % 2 % 3 % 4 % 5, Range.to(1, 5).reduceLeft(_.modulo_))
    }

    public function testLessThan_(): void {
      assertTrue(_.lessThan_(1,2))
      assertFalse(_.lessThan_(1,1))
      assertFalse(_.lessThan_(2,1))
    }

    public function testGreaterThan_(): void {
      assertFalse(_.greaterThan_(1,2))
      assertFalse(_.greaterThan_(1,2))
      assertTrue(_.greaterThan_(2,1))
    }

    public function testGreaterEqual_(): void {
      assertFalse(_.greaterEqual_(1,2))
      assertTrue(_.greaterEqual_(1,1))
      assertTrue(_.greaterEqual_(2,1))
    }

    public function testLessEqual_(): void {
      assertTrue(_.lessEqual_(1,2))
      assertTrue(_.lessEqual_(1,1))
      assertFalse(_.lessEqual_(2,1))
    }

    public function testEqual_(): void {
      const a: int = 1
      const b: int = 1
      assertFalse(_.equal_({}, {}))
      assertTrue(_.equal_(a, b))
      assertTrue(_.equal_(b, a))
      assertTrue(_.equal_(some(a), some(b)))
      assertTrue(_.equal_(some(b), some(a)))
    }

    public function testNotEqual_(): void {
      const a: int = 1
      const b: int = 1
      assertTrue(_.notEqual_({}, {}))
      assertFalse(_.notEqual_(a, b))
      assertFalse(_.notEqual_(b, a))
      assertFalse(_.notEqual_(some(a), some(b)))
      assertFalse(_.notEqual_(some(b), some(a)))
    }
  }
}