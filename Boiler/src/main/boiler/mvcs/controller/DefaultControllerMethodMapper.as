package boiler.mvcs.controller {
	import flash.utils.getDefinitionByName;

	import boiler.mvcs.dispatcher.Dispatcher;
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;

	public class DefaultControllerMethodMapper implements ControllerMethodMapper {
		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var dispatcher:Dispatcher;

		public function mapController(type:Class):void {
			var reflection:Reflection = reflector.getReflection(type);

			for each (var method:XML in reflection.type().factory.method) {
				registerMethod(method, type);
			}
		}

		private function registerMethod(method:XML, type:Class):void {
			if (! hasCorrectParameterLength(method))
				return;

			dispatcher.registerSignalClass(getSignalParameterClass(method), type, method.@name);
		}

		private function getSignalParameterClass(method:XML):* {
			return getDefinitionByName(method.parameter[0].@type);
		}

		private function hasCorrectParameterLength(method:XML):Boolean {
			return method.parameter.length() == 1;
		}

	}
}
