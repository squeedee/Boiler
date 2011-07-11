package metalegs.mvcs.controller {
	import metalegs.base.reflection.Reflector;
	import metalegs.hookableSuspenders.handlers.mapping.AfterMapClassHandler;
	import metalegs.hookableSuspenders.handlers.mapping.AfterMapSingletonHandler;
	import metalegs.mvcs.reflection.MVCSReflection;

	import org.swiftsuspenders.InjectionConfig;

	public class ControllerExtension implements AfterMapSingletonHandler, AfterMapClassHandler {

		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var controllerDetector:ControllerDetector;

		public function afterMapValue(newConfig:InjectionConfig):void {
			handleMapping(newConfig.request)
		}

		public function afterMapClass(newConfig:InjectionConfig):void {
			handleMapping(newConfig.request)
		}

		private function handleMapping(type:Class):void {

			if (! controllerDetector.isController(type))
				return;

			// store mappings here
			var reflection:MVCSReflection = MVCSReflection(reflector.getReflection(type));
			trace(reflection.xml());
		}

	}
}
