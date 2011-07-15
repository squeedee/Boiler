package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.mvcs.controller.ControllerDetector;
	import metalegs.mvcs.controller.ControllerExtension;
	import metalegs.mvcs.controller.ControllerMethodMapper;
	import metalegs.mvcs.controller.DefaultControllerDetector;
	import metalegs.mvcs.controller.DefaultControllerMethodMapper;

	public class ConfigureController extends ConfigurationBase {

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
