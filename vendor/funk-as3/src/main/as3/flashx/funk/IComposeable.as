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
	public interface IComposeable extends IFunkObject {
		/**
		 * Builds and returns <code>h</code> with <code>h := g(x); f(y)</code>.
		 *
		 * g is usually defined in a different scope of the IComposable.
		 *
		 * @param f The function f in <code>g(x); f(y)</code>.
		 * @param thisArg The <code>this</code> argument of the function f.
		 * @param argArray The arguments for the given function.
		 * @return The sequence <code>g(..?); f(x)</code>
		 */
		function andThen(f: Function, thisArg: * = null, argArray: Array = null): Function

		/**
		 * Builds and returns <code>h</code> with <code>h := f(g(x))</code>.
		 *
		 * g is usually defined in a different scope of the IComposable.
		 *
		 * @param f The function f in <code>f(g(x))</code>
		 * @return The composition <code>f(g(x))</code>
		 */
		function andContinue(f: Function): Function
	}
}