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

  import flashx.funk.collections.IList
  import flashx.funk.collections.nil
  import flashx.funk.ioc.error.BindingError
  import flashx.funk.util.isAbstract

  public final class Injector {
    private static const _map: Dictionary = new Dictionary
    private static var _scopes: IList = nil
    private static var _modules: IList = nil
    private static var _currentScope: IModule

    public static function initialize(module: IModule): IModule {
      module.initialize()
      _modules = _modules.prepend(module)
      return module
    }
    
    module_internal static function pushScope(module: IModule): void {
      _currentScope = module
      _scopes = _scopes.prepend(module)
    }

    module_internal static function popScope(): void {
      _scopes = _scopes.tail
      _currentScope = _scopes.nonEmpty ? IModule(_scopes.head) : null
    }

    module_internal static function get currentScope(): IModule {
      return _currentScope
    }

    module_internal static function scopeOf(klass: Class): IModule {
      var result: IModule = null
      var module: IModule = null
      var modules: IList = _modules

      while(modules.nonEmpty) {
        module = IModule(modules.head)

        if(module.binds(klass)) {
          if(null != result) {
            throw new BindingError("More than one module binds "+klass+".")
          }
          result = IModule(modules.head)
        }

        modules = modules.tail
      }

      if(null == result) {
        throw new BindingError("No binding for "+klass+" could be fond.")
      }
      
      return result
    }

    module_internal static function moduleOf(klass: Class): IModule {
      const possibleResult: IModule = _map[klass]

      if(null != possibleResult) {
        return possibleResult
      }

      var module: IModule = null
      var modules: IList = _modules

      while(modules.nonEmpty) {
        module = IModule(modules.head)

        if(module is klass) {
          _map[klass] = module
          return module
        }

        modules = modules.tail
      }

      throw new BindingError("No module for "+klass+" could be found.")
    }

    [Abstract] public function Injector() { isAbstract() }
  }
}