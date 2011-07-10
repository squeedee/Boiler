package metalegs.mvcs.controller {
	import metalegs.base.util.reflection.Reflector;
	import metalegs.hookableSuspenders.handlers.mapping.AfterMapClassHandler;
	import metalegs.hookableSuspenders.handlers.mapping.AfterMapSingletonHandler;

	import org.swiftsuspenders.InjectionConfig;

	public class ControllerExtension implements AfterMapSingletonHandler, AfterMapClassHandler {

		[Inject]
		public var reflector:Reflector;

		public function afterMapValue(newConfig:InjectionConfig):void {
			handleMapping(newConfig.request)
		}

		public function afterMapClass(newConfig:InjectionConfig):void {
			handleMapping(newConfig.request)
		}

		private function handleMapping(type:Class):void {
			trace("Instanced: " + reflector.getReflection(type).fqn())

		}
	}
}
