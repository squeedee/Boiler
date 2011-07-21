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
	import flexunit.framework.TestCase

	/**
	 * @author Joa Ebert
	 */
	public final class TestFork extends TestCase {
		public function testForkAndThenWithoutForce(): void {
			var n: int = 0
			var f: Function = fork(
				function(next: Function): void {
					assertEquals(1, ++n)
          next()
				}
			).andThen(
				function(): void {
					assertEquals(2, ++n)
				}
			)

			assertEquals(0, n)
			f()
			assertEquals(2, n)
		}

		public function testForkAndThenWithForce(): void {
			var n: int = 0
			var f: Function = fork(
				function(next: Function): void {
					assertEquals(1, ++n)
          next()
				}, null, null, true
			).andThen(
				function(): void {
					assertEquals(2, ++n)
				}
			)

			assertEquals(0, n)
			f()
			assertEquals(0, n)
		}

		public function testForkAndContinueWithoutForce(): void {
			var n: int = 0;
			var f: Function = fork(
				function(next: Function): void {
					assertEquals(1, ++n)
					next(n)
				}
			).andContinue(function(x: int): void {
				assertEquals(n, x)
				assertEquals(2, ++n)
			})

			assertEquals(0, n)
			f()
			assertEquals(2, n)
		}

    public function testForkAndContinueWithForce(): void {
			var n: int = 0;
			var f: Function = fork(
				function(next: Function): void {
					assertEquals(1, ++n)
					next(n)
				}, null, null, true
			).andContinue(function(x: int): void {
				assertEquals(n, x)
				assertEquals(2, ++n)
			})

			assertEquals(0, n)
			f()
			assertEquals(0, n)
		}
	}
}