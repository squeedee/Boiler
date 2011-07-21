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
  import flashx.funk.closure
  import flashx.funk.error.NoSuchElementError;
  import flashx.funk.test.assertThrows;

  import flexunit.framework.TestCase;

  public final class TestNone extends TestCase {
    public function testIsDefined(): void {
      assertFalse(none.isDefined)
    }

    public function testIsEmpty(): void {
      assertTrue(none.isEmpty)
    }

    public function testGet():void {
      assertThrows(function(): void { none.get }, NoSuchElementError)
    }

    public function testGetOrElse():void {
      const value: Object = {};
      assertStrictlyEquals(value, none.getOrElse(function(): Object { return value }))
    }

    public function testFilter(): void {
      assertStrictlyEquals(none,
          none.filter(
              function(x: *): Boolean { fail("Filter function must not be called."); return true }
              )
          )
    }

    public function testForeach(): void {
      none.foreach(function(x: *): void { fail("Foreach function must not be called.") })
    }

    public function testFlatMap(): void {
      assertStrictlyEquals(none,
          none.flatMap(
              function(x: *): IOption {
                fail("FlatMap function must not be called.")
                return some({})
              }
              )
          )
    }

    public function testMap(): void {
      assertStrictlyEquals(none,
          none.map(
              function(x: *): * {
                fail("Map function must not be called.")
                return some({})
              }
              )
          )
    }

    public function testOrElse(): void {
      const alternative: Function = function(): IOption { return some(false) }

      assertFalse(none.orElse(alternative).get)
      assertTrue(alternative().equals(none.orElse(alternative)))
    }

    public function testProductArity(): void {
      assertEquals(0, none.productArity)
    }

    public function testProductElement(): void {
      assertThrows(closure(none.productElement, 0), RangeError)
    }

    public function testProductPrefix(): void {
      assertEquals("None", none.productPrefix)
    }

    public function testToString(): void {
      assertEquals("None", none.toString())
    }

    public function testEquals(): void {
      assertTrue(none.equals(none))
      assertFalse(some(null).equals(none))
      assertFalse(some(undefined).equals(none))
    }
  }
}