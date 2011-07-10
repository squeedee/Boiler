package minilegs.controller {
	import minilegs.base.reflection.Reflector;
	import minilegs.hookableSuspenders.AfterMapClassHandler;
	import minilegs.hookableSuspenders.AfterMapSingletonHandler;

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
