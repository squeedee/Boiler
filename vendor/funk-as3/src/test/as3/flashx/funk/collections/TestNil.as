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
  import flashx.funk._
  import flashx.funk.closure
  import flashx.funk.error.NoSuchElementError
  import flashx.funk.option.none
  import flashx.funk.test.assertThrows
  import flashx.funk.test.identity
  import flashx.funk.test.mapFalse
  import flashx.funk.test.mapTrue

  import flexunit.framework.TestCase

  public class TestNil extends TestCase {

    public function testContains(): void {
      assertFalse(nil.contains(undefined))
    }

    public function testCount(): void {
      nil.count(function(): Boolean {
        fail("Count function must not be called.")
        return true
      })
    }

    public function testNotEmpty(): void {
      assertFalse(nil.nonEmpty)
    }

    public function testDrop(): void {
      assertStrictlyEquals(nil, nil.drop(0))
      assertThrows(closure(nil.drop, -1), ArgumentError)
    }

    public function testDropRight(): void {
      assertStrictlyEquals(nil, nil.dropRight(0))
      assertThrows(closure(nil.dropRight, -1), ArgumentError)
    }

    public function testDropWhile(): void {
      assertStrictlyEquals(nil, nil.dropWhile(mapTrue))
      nil.dropWhile(function(x: *): Boolean {
        fail("DropWhile function must not be called.")
        return true
      })
    }

    public function testExists(): void {
      assertFalse(nil, nil.exists(mapTrue))
      nil.exists(function(x: *): Boolean {
        fail("Exists function must not be called.")
        return true
      })
    }

    public function testFilter(): void {
      assertStrictlyEquals(nil, nil.filter(mapTrue))
      nil.filter(function(x: *): Boolean {
        fail("Filter function must not be called.")
        return true
      })
    }

    public function testFilterNot(): void {
      assertStrictlyEquals(nil, nil.filter(mapFalse))
      nil.filterNot(function(x: *): Boolean {
        fail("FilterNot function must not be called.")
        return true
      })
    }

    public function testFind(): void {
      assertStrictlyEquals(none, nil.find(mapTrue))
      nil.find(function(x: *): Boolean {
        fail("Find function must not be called.")
        return true
      })
    }

    public function testFindIndexOf(): void {
      assertEquals(-1, nil.findIndexOf(mapTrue))
      nil.findIndexOf(function(x: *): Boolean {
        fail("FindIndexOf function must not be called.")
        return true
      })
    }

    public function testFlatMap(): void {
      assertStrictlyEquals(nil, nil.flatMap(identity))
      nil.flatMap(function(x: *): IList {
        fail("FlatMap function must not be called.")
        return nil
      })
    }

    public function testFlatten(): void {
      assertStrictlyEquals(nil, nil.flatten)
    }

    public function testFoldLeft(): void {
      assertEquals(0, nil.foldLeft(0, _.plus_))
      nil.foldLeft(0, function(x: int, y: int): int {
        fail("FoldLeft function must not be called.")
        return x + y
      })
    }

    public function testFoldRight(): void {
      assertEquals(0, nil.foldRight(0, _.plus_))
      nil.foldRight(0, function(x: int, y: int): int {
        fail("FoldRight function must not be called.")
        return x + y
      })
    }

    public function testForall(): void {
      assertFalse(nil.forall(mapTrue))
      nil.forall(function(x: *): Boolean {
        fail("Forall function must not be called.")
        return true
      })
    }

    public function testForeach(): void {
      nil.foreach(function(x: *): void {
        fail("Foreach function must not be called.")
      })
    }

    public function testGet(): void {
      assertThrows(closure(nil.get, 0), RangeError)
    }

    public function testHead(): void {
      assertThrows(function(): * {
        return nil.head
      }, NoSuchElementError)
    }

    public function testHeadOption(): void {
      assertStrictlyEquals(none, nil.headOption)
    }

    public function testIndexOf(): void {
      assertEquals(-1, nil.indexOf(undefined))
    }

    public function testIndices(): void {
      assertStrictlyEquals(nil, nil.indices)
    }

    public function testInit(): void {
      assertStrictlyEquals(nil, nil.init)
    }

    public function testIsEmpty(): void {
      assertTrue(nil.isEmpty)
    }

    public function testLast(): void {
      assertThrows(function(): * {
        return nil.head
      }, NoSuchElementError)
    }

    public function testMap(): void {
      assertStrictlyEquals(nil, nil.map(mapTrue))
      nil.map(function(x: *): Boolean {
        fail("Map function must not be called.")
        return true
      })
    }

    public function testPartition(): void {
      assertStrictlyEquals(nil, nil.partition(mapTrue)._1)
      assertStrictlyEquals(nil, nil.partition(mapTrue)._2)
      nil.partition(function(x: *): Boolean {
        fail("Partition function must not be called.")
        return true
      })
    }

    public function testPrepend(): void {
      const value: Object = {}
      assertEquals(1, nil.prepend(value).size)
      assertStrictlyEquals(value, nil.prepend(value).get(0))
    }

    public function testPrependAll(): void {
      const l: IList = list({}, {}, {})
      assertEquals(l.size, nil.prependAll(l).size)
      for(var i: int = 0, n: int = l.size; i < n; ++i) {
        assertStrictlyEquals(l.get(i), nil.prependAll(l).get(i))
      }
      assertEquals(0, nil.prependAll(nil).size)
      assertStrictlyEquals(nil, nil.prependAll(nil))
    }

    public function testReduceLeft(): void {
      assertUndefined(nil.reduceLeft(_.plus_))
    }

    public function testReduceRight(): void {
      assertUndefined(nil.reduceLeft(_.plus_))
    }

    public function testReverse(): void {
      assertStrictlyEquals(nil, nil.reverse)
    }

    public function testTail(): void {
      assertThrows(function(): * {
        return nil.tail
      }, NoSuchElementError)
    }

    public function testTailOption(): void {
      assertStrictlyEquals(none, nil.tailOption)
    }

    public function testTake(): void {
      assertStrictlyEquals(nil, nil.take(0))
      assertThrows(closure(nil.take, -1), ArgumentError)
    }

    public function takeRight(): void {
      assertStrictlyEquals(nil, nil.takeRight(0))
      assertThrows(closure(nil.takeRight, -1), ArgumentError)
    }

    public function testTakeWhile(): void {
      assertStrictlyEquals(nil, nil.takeWhile(mapTrue))
      nil.takeWhile(function(x: *): Boolean {
        fail("TakeWhile function must not be called.")
        return true
      })
    }

    public function testZip(): void {
      assertStrictlyEquals(nil, nil.zip(Range.until(0, 10)))
    }

    public function testZipWithIndex(): void {
      assertStrictlyEquals(nil, nil.zipWithIndex)
    }

    public function testProductArity(): void {
      assertEquals(0, nil.productArity)
    }

    public function testProductElement(): void {
      assertThrows(closure(nil.productElement, 0), RangeError)
    }

    public function testProductPrefix(): void {
      assertEquals("List", nil.productPrefix)
    }

    public function testMkString(): void {
      assertEquals("", nil.mkString("."))
    }

    public function testEquals(): void {
      assertFalse(nil.equals(list(undefined)))
      assertFalse(nil.equals(list(null)))
      assertFalse(nil.equals(list({})))
      assertTrue(nil.equals(nil))
      assertTrue(nil.equals(list(1).tail))
    }

    public function testSize(): void {
      assertEquals(0, nil.size)
    }

    public function testHasDefinedSize(): void {
      assertTrue(nil.hasDefinedSize)
    }

    public function testToArray(): void {
      assertEquals(0, nil.toArray.length)
    }

    public function testToVector(): void {
      assertEquals(0, nil.toVector.length)
    }

    public function testToFixedVector(): void {
      assertEquals(0, nil.toFixedVector.length)
      assertTrue(nil.toFixedVector.fixed)
    }
  }
}