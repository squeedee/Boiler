package boiler.steam.controller {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;
	import boiler.reflection.helpers.EventDrivenMethodHelper;
	import boiler.reflection.helpers.EventHelper;
	import boiler.steam.dispatcher.Dispatcher;

	import flash.utils.getDefinitionByName;

	public class DefaultControllerMethodMapper implements ControllerMethodMapper {

		private var eventDrivenMethodHelper:EventDrivenMethodHelper;

		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var dispatcher:Dispatcher;

		[PostConstruct]
		public function setup():void {
			eventDrivenMethodHelper = new EventDrivenMethodHelper(reflector);
		}

		public function mapController(controllerType:Class):void {
			var reflection:Reflection = reflector.getReflection(controllerType);

			dispatcher.withController(controllerType);

			for each (var methodDefinition:XML in reflection.methods()) {
				registerMethod(methodDefinition);
			}
		}

		private function registerMethod(methodDefinition:XML):void {
			var eventType:Class	= eventDrivenMethodHelper.getEventFromMethodDefinition(methodDefinition);

			if (eventType == null)
				return;

			dispatcher.invokeMethod(methodDefinition.@name).fromEvent(eventType);
		}

	}
}
