package boiler.mvcs.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.mvcs.controller.ControllerDetector;
	import boiler.mvcs.controller.ControllerExtension;
	import boiler.mvcs.controller.ControllerMethodMapper;
	import boiler.mvcs.controller.DefaultControllerDetector;
	import boiler.mvcs.controller.DefaultControllerMethodMapper;

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
