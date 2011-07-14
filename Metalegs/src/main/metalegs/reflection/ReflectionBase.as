package metalegs.reflection {
	import flash.utils.describeType;

	import mx.utils.StringUtil;

	public class ReflectionBase implements Reflection {
		private var _source:Class;
		private var _type:XML;
		private var _instance:XML;
		private var _fqn:String;

		public function reflect(type:Class):Reflection {
			_source = type;

			_type = describeType(type);

			try {
				_instance = describeType(new type());
			} catch (error:Error) {
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

		public function type():XML {
			return _type;
		}

		public function fqn():String {
			return _fqn ||= _type.@name;
		}

		public function instance():XML {
			return _instance;

		}

		// Helpers

		public function hasAnyNamespace(anyNamespaceCalled:String):Boolean {
			return (fqn().search("\\.*" + anyNamespaceCalled + "[:.]") >= 0);
		}

		public function hasLeafNamespace(leafNamespaceCalled:String):Boolean {
			return (fqn().search("\\.*" + leafNamespaceCalled + ":") >= 0);
		}

		public function classConstants():XMLList {

			return type().constant;
		}

		public function classMetadata():XMLList {
			return instance().metadata;
		}
	}
}
