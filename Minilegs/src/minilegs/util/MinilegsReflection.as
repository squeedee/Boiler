package minilegs.util {
	import flash.utils.describeType;

	import minilegs.base.Reflection;

	public class MinilegsReflection implements Reflection {
		private var _reflectedClass:Class;
		private var _reflectionXML:XML;

		private function processReflection(clazz:Class):void {
			_reflectionXML = describeType(clazz);

		}

		public function source():Class {
			return _reflectedClass;
		}

		public function xml():XML {
			return _reflectionXML;
		}

		public function reflect(clazz:Class):Reflection {
			_reflectedClass = clazz;
			processReflection(clazz);
			return this;
		}
	}
}
