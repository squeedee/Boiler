package metalegs.mvcs.reflection {
	import flash.utils.describeType;

	import metalegs.base.reflection.Reflection;

	import mx.utils.StringUtil;

	public class MVCSReflection implements Reflection {
		private var _source:Class;
		private var _xml:XML;
		private var _fqn:String;
		private var _includesClassMetadata:Boolean = true;

		public function reflect(type:Class):Reflection {
			_source = type;

			try {
				_xml = describeType(new type());
			} catch (error:Error) {
				_xml = describeType(type);
				_includesClassMetadata = false;
				trace(StringUtil.substitute(
						"Warning, could not read class metadata of {0} with error:\n{1}",
						fqn(),
						error.message
				));
			}

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

		public function hasAnyNamespace(anyNamespaceCalled:String):Boolean {
			return (_fqn.search("\\.*" + anyNamespaceCalled + "[:.]") >= 0);
		}

		public function hasLeafNamespace(leafNamespaceCalled:String):Boolean {
			return (_fqn.search("\\.*" + leafNamespaceCalled + ":") >= 0);
		}

		public function includesClassMetadata():Boolean {
			return _includesClassMetadata;
		}
	}
}
