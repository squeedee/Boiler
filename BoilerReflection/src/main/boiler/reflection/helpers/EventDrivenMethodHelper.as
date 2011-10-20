package boiler.reflection.helpers {
	import boiler.reflection.Reflector;

	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class EventDrivenMethodHelper {

		private var typeHelper:TypeHelper;

		public function EventDrivenMethodHelper(reflector:Reflector) {
			typeHelper = new TypeHelper(reflector);
		}

		public function isEventDrivenMethodDefinition(methodDefinition:XML):Boolean {
			return getEventFromMethodDefinition(methodDefinition) != null;
		}

		public function getEventFromMethodDefinition(methodDefinition:XML):Class {
			if (hasNoParameters(methodDefinition))
				return null;

			if (hasMoreThanOneRequiredParameter(methodDefinition))
				return null;

			return firstParameterEventType(methodDefinition);
		}

		private function firstParameterEventType(method:XML):Class {
			var firstParameterType:Class = Class(getDefinitionByName(method.parameter.(@index == "1").@type));

			if (!typeIsEvent(firstParameterType))
				return null;

			return firstParameterType;
		}

		private function typeIsEvent(firstParameterType:Class):Boolean {
			return typeHelper.type(firstParameterType).isA(Event);
		}

		private function hasMoreThanOneRequiredParameter(method:XML):Boolean {
			return method.parameter.(@optional == 'false').length() > 1;
		}

		private function hasNoParameters(method:XML):Boolean {
			return method.parameter.length() == 0;
		}
	}
}
