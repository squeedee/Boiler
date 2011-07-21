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
  import flash.utils.Dictionary

  import flashx.funk.ioc.error.BindingError

  public class AbstractModule implements IModule {
    private const _map: Dictionary = new Dictionary
    private var _initialized: Boolean = false

    public function AbstractModule() {
    }
    
    protected function configure(): void {
    }
    
    public final function initialize(): void {
      configure()
      _initialized = true
    }

    protected final function bind(klass: Class): Binding {
      if(null != _map[klass]) {
        throw new BindingError(klass+" is already bound.")
      }
      
      const binding: Binding = new Binding(this, klass)

      _map[klass] = binding

      return binding
    }

    public final function getInstance(klass: Class): * {
      if(!_initialized) {
        throw new BindingError("Modules have to be created using \"Injector.initialize(new Module())\".")
      }

      const binding: Binding = _map[klass]
      
      try {
        Injector.module_internal::pushScope(this)
        return (null == binding) ? new klass : binding.getInstance()
      } finally {
        Injector.module_internal::popScope()
      }
    }

    public function binds(klass: Class): Boolean {
      return _map[klass] != null
    }
  }
}