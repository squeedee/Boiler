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

package flashx.funk.ioc {
  import flexunit.framework.Assert

  internal final class MockObject {
    private const _byProvider: IMockProviderObject = inject(IMockProviderObject)
    private const _byInstance: String = inject(String)
    private const _byObject: IAnotherObject = inject(IAnotherObject)
    private const _byObjectAsSingleton: SingletonInstance = inject(SingletonInstance)
    
    public function get byProvider(): IMockProviderObject {
      return _byProvider
    }

    public function get byInstance(): String {
      return _byInstance
    }

    public function get byObject(): IAnotherObject {
      return _byObject
    }
  }
}