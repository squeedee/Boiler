package boiler.reflection.helpers {
	import boiler.reflection.Reflector;

	public class EventHelper {
		private var _reflector:Reflector;

		public function EventHelper(reflector:Reflector) {
			_reflector = reflector;
		}

		public function getEventsFromEventType(eventType:Class):Array {
			var list:Array = [];
			var constants:XMLList = _reflector.getReflection(eventType).classConstants();

			for each (var constantDefinition:XML in constants) {
				list.push(eventType[constantDefinition.@name]);
			}

			return list;
		}
	}
}
