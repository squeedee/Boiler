package metalegs.mvcs.util {
	import flash.utils.describeType;

	import metalegs.base.util.reflection.Reflection;

	public class MVCSReflection implements Reflection {
		private var _source:Class;
		private var _xml:XML;
		private var _fqn:String;

		public function reflect(type:Class):Reflection {
			_source = type;
			_xml = describeType(type);
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
