package boiler.steam.controller {
	import hookableSuspenders.handlers.mapping.AfterMapClassHandler;
	import hookableSuspenders.handlers.mapping.AfterMapSingletonHandler;

	import org.swiftsuspenders.InjectionConfig;

	public class ControllerExtension implements AfterMapSingletonHandler, AfterMapClassHandler {

		[Inject]
		public var controllerDetector:ControllerDetector;

		[Inject]
		public var methodMapper:ControllerMethodMapper;

		public function afterMapSingleton(newConfig:InjectionConfig):void {
			handleMapping(newConfig.request)
		}

		public function afterMapClass(newConfig:InjectionConfig):void {
			handleMapping(newConfig.request)
		}

		private function handleMapping(type:Class):void {
			if (! controllerDetector.isController(type))
				return;

			methodMapper.mapController(type);
		}

	}
}
