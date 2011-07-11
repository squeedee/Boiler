package metalegs.mvcs.controller {
	import metalegs.base.reflection.Reflector;
	import metalegs.hookableSuspenders.handlers.mapping.AfterMapClassHandler;
	import metalegs.hookableSuspenders.handlers.mapping.AfterMapSingletonHandler;
	import metalegs.mvcs.dispatcher.Dispatcher;
	import metalegs.mvcs.reflection.MVCSReflection;

	import org.swiftsuspenders.InjectionConfig;

	public class ControllerExtension implements AfterMapSingletonHandler, AfterMapClassHandler {

		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var controllerDetector:ControllerDetector;

		[Inject]
		public var dispatcher:Dispatcher;

		public function afterMapValue(newConfig:InjectionConfig):void {
			//handleMapping(newConfig.request)
		}

		public function afterMapClass(newConfig:InjectionConfig):void {
			//handleMapping(newConfig.request)
		}

		private function handleMapping(type:Class):void {

			if (! controllerDetector.isController(type))
				return;

			// make mappings here
			var reflection:MVCSReflection = MVCSReflection(reflector.getReflection(type));

			// dispatcher.registerSignalClass()

			trace(reflection.xml());
		}

	}
}
