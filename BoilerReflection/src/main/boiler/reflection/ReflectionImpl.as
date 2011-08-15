package boiler.reflection {
	import flash.utils.describeType;

	import mx.utils.StringUtil;

	public class ReflectionImpl implements Reflection {
		private var _source:Class;
		private var _type:XML;
		private var _instance:XML;
		private var _fqn:String;

		public function reflect(type:Class):Reflection {
			// todo this is clearly not the way to deal with types needing instances. Time to procure some help with the reflector..
			// todo I like the look of the code in Fussy that does this. 

			_source = type;

			_type = describeType(type);

			try {
				if (isClass())
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

		private function isClass():Boolean {
			return ! isInterface();
		}

		private function isInterface():Boolean {
			return (_type.factory.extendsClass.length() == 0) && (_type.factory.type != "Object")

		}

		public function source():Class {
			return _source;
		}

		public function type():XML {
			return _type;
		}

		public function fqn():String {
			return _fqn ||= _type.@name.replace(/::/, ".");
		}

		public function instance():XML {
			return _instance;
		}

		public function classConstants():XMLList {
			return type().constant;
		}

		public function classMetadata():XMLList {
			return instance().metadata;
		}

		public function methods():XMLList {
			return instance().method;
		}

		public function findMethodByName(methodName:String):XML {
			var result:XMLList = instance().method.(@name == methodName);
			if (result.length() != 1)
				return null;

			return result[0];
		}
	}
}
