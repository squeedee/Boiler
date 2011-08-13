package boiler.reflection.helpers {
	import boiler.reflection.Reflector;

	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class EventDrivenMethodHelper {
		private var _reflector:Reflector;

		private static const EVENT_CLASS_NAME:String = getQualifiedClassName(Event);

		public function EventDrivenMethodHelper(reflector:Reflector) {
			_reflector = reflector;
		}

		public function isEventDrivenMethodDefinition(method:XML):Boolean {
			if (hasNoParameters(method))
				return false;

			if (hasMoreThanOneRequiredParameter(method))
				return false;

			return firstParameterIsEvent(method);
		}

		private function firstParameterIsEvent(method:XML):Boolean {
			var parameterClass:Class = Class(getDefinitionByName(method.parameter.(@index == "1").@type));

			var type:XML = _reflector.getReflection(parameterClass).type();

			return type.factory.extendsClass.(@type == EVENT_CLASS_NAME).length() > 0;

		}

		private function hasMoreThanOneRequiredParameter(method:XML):Boolean {
			return method.parameter.(@optional == 'false').length() > 1;
		}

		private function hasNoParameters(method:XML):Boolean {
			return method.parameter.length() == 0;
		}
	}
}
