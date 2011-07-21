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
  import flashx.funk.test.assertThrows
  import flashx.funk.test.identity

  import flexunit.framework.TestCase

  public class TestLazy extends TestCase {
    public function testLazy(): void {
      var n: int = 0
      const value: ILazy = lazy(function(): Boolean {
        n++
        return true
      })

      assertEquals(0, n)
      assertTrue(value.get)
      assertEquals(1, n)
      assertTrue(value.get)
      assertEquals(1, n)
    }

    public function testClosureEvaluation(): void {
      const myClass: Object = {
        expensiveComputation: function(x: int): int {
          assertEquals(1, x)
          myClass.evaluated = true
          return 2
        },
        evaluated: false
      }

      assertFalse(myClass.evaluated)
      const l: ILazy = lazy(closure(_.expensiveComputation(1), myClass))
      assertFalse(myClass.evaluated)
      assertEquals(2, l.get)
      assertTrue(myClass.evaluated)
    }

    public function testProductArity(): void {
      assertEquals(1, lazy(identity).productArity)
    }

		public function testProductElement(): void {
      const value: Object = {}
      const l: ILazy = lazy(function(): Object {
        return value
      })

      assertStrictlyEquals(value, l.productElement(0))
      assertThrows(closure(l.productElement, 1), RangeError)
      assertThrows(closure(l.productElement, -1), RangeError)
    }

		public function testProductPrefix(): void {
      assertEquals("", lazy(identity).productPrefix)
    }

    public function testMkString(): void {
      const value: Object = {}
      assertEquals(value.toString(), lazy(function(): Object { return value }).get.toString())
    }

    public function testEquals(): void {
      const value: Object = {}
      assertTrue(lazy(function(): Object { return value }).equals(lazy(function(): Object { return value })))
    }
  }
}