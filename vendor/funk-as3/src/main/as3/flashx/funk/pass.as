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
  import flashx.funk.util.isAbstract

  public final class pass {
    public static function any(value: *): Function {
      return function(): * { return value }
    }

    public static function string(value: String): Function {
      return function(): String { return value }
    }

    public static function bool(value: Boolean): Function {
      return function(): Boolean { return value }
    }

    public static function integer(value: int): Function {
      return function(): int { return value }
    }

    public static function unsignedInteger(value: uint): Function {
      return function(): uint { return value }
    }

    public static function number(value: Number): Function {
      return function(): Number { return value }
    }

    public static function xml(value: XML): Function {
      return function(): XML { return value }
    }

    public static function object(object: Object): Function {
      return function(): Object { return object }
    }

    public static function instanceOf(klass: Class): Function {
      return function(): Object { return new klass }
    }

    public static function klass(klass: Class): Function {
      return function(): Class { return klass }
    }

    [Abstract] public function pass() { isAbstract() }
  }
}