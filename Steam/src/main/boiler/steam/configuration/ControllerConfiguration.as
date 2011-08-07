package boiler.steam.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.steam.controller.ControllerDetector;
	import boiler.steam.controller.ControllerExtension;
	import boiler.steam.controller.ControllerMethodMapper;
	import boiler.steam.controller.DefaultControllerDetector;
	import boiler.steam.controller.DefaultControllerMethodMapper;

	public class ControllerConfiguration extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(ControllerDetector, DefaultControllerDetector);
			lifetime.mapSingletonOf(ControllerMethodMapper, DefaultControllerMethodMapper);
			lifetime.mappingHandlers.add(ControllerExtension);
		}

		override public function teardown():void {

			lifetime.mappingHandlers.remove(ControllerExtension);
			lifetime.unmap(ControllerMethodMapper);
			lifetime.unmap(ControllerDetector);

		}
	}
}
