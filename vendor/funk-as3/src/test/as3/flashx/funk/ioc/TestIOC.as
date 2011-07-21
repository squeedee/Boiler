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
  import flash.display.Sprite

  import flashx.funk.closure
  import flashx.funk.ioc.error.BindingError
  import flashx.funk.test.assertThrows

  import flexunit.framework.TestCase

  public final class TestIOC extends TestCase {
    public function testIOC(): void {
      const module: IModule = Injector.initialize(new MockModule)
      const mockObject: MockObject = module.getInstance(MockObject)

      assertEquals("Test", mockObject.byInstance)
      assertTrue(mockObject.byProvider is ProvidedObject)
      assertTrue(mockObject.byObject is AnotherObject)
      assertEquals(1, SingletonInstance.numInstances)

      const mockObject2: MockObject = module.getInstance(MockObject)

      assertEquals("Test", mockObject2.byInstance)
      assertTrue(mockObject2.byProvider is ProvidedObject)
      assertTrue(mockObject2.byObject is AnotherObject)
      assertEquals(1, SingletonInstance.numInstances)
      
      assertFalse(mockObject.byProvider == mockObject2.byProvider)
      assertFalse(mockObject.byObject == mockObject2.byObject)

      assertThrows(closure(inject, null), ArgumentError)
      assertThrows(closure(inject, Sprite), BindingError)

      const mockObject3: MockObject = new MockObject()

      assertEquals("Test", mockObject3.byInstance)
      assertTrue(mockObject3.byProvider is ProvidedObject)
      assertTrue(mockObject3.byObject is AnotherObject)
      assertEquals(1, SingletonInstance.numInstances)
    }
  }
}