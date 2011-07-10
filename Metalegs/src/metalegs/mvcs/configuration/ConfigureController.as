package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.mvcs.controller.ControllerDetector;
	import metalegs.mvcs.controller.ControllerExtension;
	import metalegs.mvcs.controller.DefaultControllerDetector;

	public class ConfigureController extends ConfigurationBase {

		override public function configure():void {
			lifetime.mapClass(ControllerDetector,DefaultControllerDetector);
			lifetime.mappingHandlers.add(ControllerExtension);
		}
	}
}
