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
  import flashx.funk.IFunkObject
  import flashx.funk.Product;
  import flashx.funk.util.eq
  import flashx.funk.util.verifiedType;

	/**
	 * The SomeImpl class represents a companion object to the <code>some</code>
	 * function.
	 *
	 * @see flashx.funk.option.some
	 * @private
	 */
  internal final class SomeImpl extends Product implements IOption {
		/**
		 * Private backing variable for the <code>get</code> property.
		 */
    private var _value: *

		/**
		 * @inheritDoc
		 */
    public function SomeImpl(value: *) {
      _value = value
    }

		/**
		 * @inheritDoc
		 */
    public function get get(): * {
      return _value
    }

		/**
		 * @inheritDoc
		 */
    public function getOrElse(f: Function): * {
      return _value
    }

		/**
		 * @inheritDoc
		 */
    public function get isDefined(): Boolean {
      return true
    }

		/**
		 * @inheritDoc
		 */
    public function get isEmpty(): Boolean {
      return false
    }

		/**
		 * @inheritDoc
		 */
    override public function equals(that: IFunkObject): Boolean {
      if(that is IOption) {
        const thatOption: IOption = IOption(that)

        if(thatOption.isDefined) {
          return eq(get, thatOption.get)
        }
      }

      return false
    }

		/**
		 * @inheritDoc
		 */
    override public function get productArity(): int {
      return 1;
    }

		/**
		 * @inheritDoc
		 */
    override public function productElement(i: int): * {
      if(i == 0)
        return get
      throw new RangeError()
    }

		/**
		 * @inheritDoc
		 */
    override public function get productPrefix(): String {
      return "Some";
    }

		/**
		 * @inheritDoc
		 */
    public function filter(f: Function): IOption {
      return f(get) === true ? this : none;
    }

		/**
		 * @inheritDoc
		 */
    public function foreach(f: Function): void {
      f(get)
    }

		/**
		 * @inheritDoc
		 */
    public function flatMap(f: Function): IOption {
      return verifiedType(f(get), IOption)
    }

		/**
		 * @inheritDoc
		 */
    public function map(f: Function): IOption {
      return some(f(get))
    }

		/**
		 * @inheritDoc
		 */
    public function orElse(f: Function): IOption {
      return this
    }
  }
}