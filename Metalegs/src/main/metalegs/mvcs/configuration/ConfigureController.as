package metalegs.mvcs.configuration {
	import metalegs.base.configuration.Configuration;
	import metalegs.mvcs.controller.ControllerDetector;
	import metalegs.mvcs.controller.ControllerExtension;
	import metalegs.mvcs.controller.DefaultControllerDetector;

	public class ConfigureController extends Configuration {

		override public function configure():void {
			lifetime.mapClass(ControllerDetector, DefaultControllerDetector);
			lifetime.mappingHandlers.add(ControllerExtension);
		}
	}
}
