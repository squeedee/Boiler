package boiler.reflection.helpers {
	import boiler.reflection.Reflector;

	import flash.utils.getQualifiedClassName;

	public class TypeHelper {
		private var currentTypeDefinition:XML;
		private var _reflector:Reflector;
		private var currentType:Class;

		public function TypeHelper(reflector:Reflector) {
			_reflector = reflector;
		}

		public function type(type:Class):TypeHelper {
			currentType = type;
			currentTypeDefinition = _reflector.getReflection(type).type();
			return this;
		}

		public function isA(type:Class):Boolean {
			if (type === currentType)
				return true;

			var className:String = getQualifiedClassName(type);
			return currentTypeDefinition.factory.extendsClass.(@type == className).length() > 0;
		}
	}
}
