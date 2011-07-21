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
  import flashx.funk.test.identity
  import flashx.funk.test.assertThrows

  import flexunit.framework.TestCase

  public final class TestSome extends TestCase {
    public function testIsDefined(): void {
      assertTrue(some({}).isDefined)
    }

    public function testIsEmpty(): void {
      assertFalse(some({}).isEmpty)
    }

    public function testGet(): void {
      const value: Object = {};

      assertStrictlyEquals(value, some(value).get)
      assertUndefined(some(undefined).get)
    }

    public function testGetOrElse(): void {
      const value: Object = {};

      assertStrictlyEquals(value, some(value).getOrElse(function(): Object {
        throw new Error()
      }))
    }

    public function testFilter(): void {
      const value: Object = {}
      const someTrue: IOption = some(value).filter(function(x: Object): Boolean {
        assertStrictlyEquals(value, x)
        return x === value
      })
      const someFalse: IOption = some(value).filter(function(x: Object): Boolean {
        assertStrictlyEquals(value, x)
        return x !== value
      })

      assertStrictlyEquals(value, someTrue.get)
      assertStrictlyEquals(none, someFalse)
    }

    public function testForeach(): void {
      const value: Object = {}
      var n: int = 0

      some(value).foreach(function(x: Object): void {
        assertStrictlyEquals(value, x)
        n += 1
      })

      assertEquals(1, n)
    }

    public function testFlatMap(): void {
      const value: Object = {}

      assertStrictlyEquals(value, some(value).flatMap(function(x: Object): IOption {
        assertStrictlyEquals(value, x)
        return some(value)
      }).get)

      assertThrows(function(): void {
        some(value).flatMap(identity)
      }, TypeError)
    }

    public function testMap(): void {
      const value: int = 1234;
      const f: Function = function(x: int): String {
        return x.toString()
      }

      assertEquals(f(value), some(value).map(f).get)
      assertTrue(some(f(value)).equals(some(value).map(f)))
    }

    public function testOrElse(): void {
      const option: IOption = some(true)
      const alternative: Function = function(): IOption {
        return some(false)
      }

      assertTrue(option.orElse(alternative).get)
      assertStrictlyEquals(option, option.orElse(alternative))
    }

    public function testProductArity(): void {
      assertEquals(1, some({}).productArity)
    }

    public function testProductElement(): void {
      const value: Object = {}

      assertStrictlyEquals(value, some(value).productElement(0))
      assertThrows(function(): void {
        some(value).productElement(1)
      }, RangeError)
    }

    public function testProductPrefix(): void {
      assertEquals("Some", some({}).productPrefix)
    }

    public function testToString(): void {
      assertEquals("Some(null)", some(null).toString())
      assertEquals("Some(1)", some(1).toString())
      assertEquals("Some(1)", some("1").toString())
      assertEquals("Some(undefined)", some(undefined).toString())
    }

    public function testEquals(): void {
      assertTrue(some(1).equals(some(1)))
      assertEquals(Object(1) == Object("1"), some(1).equals(some("1")))
      assertTrue(some(null).equals(some(null)))
      assertTrue(some(undefined).equals(some(undefined)))
      assertFalse(some({}).equals(some({})))
      assertTrue(some(some(1)).equals(some(some(1))))
    }
  }
}