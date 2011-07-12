package metalegs.mvcs.configuration {
	import metalegs.base.configuration.Configuration;
	import metalegs.mvcs.controller.ControllerDetector;
	import metalegs.mvcs.controller.ControllerExtension;
	import metalegs.mvcs.controller.ControllerMethodMapper;
	import metalegs.mvcs.controller.DefaultControllerDetector;
	import metalegs.mvcs.controller.DefaultControllerMethodMapper;

	public class ConfigureController extends Configuration {

		override public function configure():void {
			lifetime.mapSingletonOf(ControllerDetector, DefaultControllerDetector);
			lifetime.mapSingletonOf(ControllerMethodMapper,DefaultControllerMethodMapper);
			lifetime.mappingHandlers.add(ControllerExtension);
		}
	}
}
