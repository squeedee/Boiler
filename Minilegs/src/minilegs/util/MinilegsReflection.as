package minilegs.util {
	import flash.utils.describeType;

	import minilegs.base.reflection.Reflection;

	public class MinilegsReflection implements Reflection {
		private var _source:Class;
		private var _xml:XML;
		private var _fqn:String;

		public function reflect(clazz:Class):Reflection {
			_source = clazz;
			_xml = describeType(clazz);
			return this;
		}

		public function source():Class {
			return _source;
		}

		public function xml():XML {
			return _xml;
		}

		public function fqn():String {
			return _fqn ||= _xml.@name;
		}
	}
}
