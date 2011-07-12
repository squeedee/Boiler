package metalegs.mvcs.controller {
	import flash.utils.getDefinitionByName;

	import metalegs.base.reflection.Reflector;
	import metalegs.mvcs.dispatcher.Dispatcher;
	import metalegs.mvcs.reflection.MVCSReflection;

	public class DefaultControllerMethodMapper implements ControllerMethodMapper {
		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var dispatcher:Dispatcher;

		public function mapController(type:Class):void {
			var reflection:MVCSReflection = MVCSReflection(reflector.getReflection(type));

			for each (var method:XML in reflection.type().method) {
				registerMethod(method, type);
			}

		}

		private function registerMethod(method:XML, type:Class):void {
			if (! correctParameterLength(method))
				return;

			trace("Mapping Controller Method: " + method.@name);
			dispatcher.registerSignalClass(getSignalParameterClass(method), type, method.@name);
		}

		private function getSignalParameterClass(method:XML):* {
			return getDefinitionByName(method.parameter[0].@type);
		}

		private function correctParameterLength(method:XML):Boolean {
			return method.parameter.length() == 1;
		}

	}
}
