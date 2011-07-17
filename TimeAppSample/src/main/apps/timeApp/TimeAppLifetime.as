package apps.timeApp {
	import apps.timeApp.configuration.TimeAppConfig;

	import flash.display.DisplayObject;

	import metalegs.mvcs.MVCSLifetime;

	public class TimeAppLifetime extends MVCSLifetime {
		public function TimeAppLifetime() {
			addConfigurationHandler(TimeAppConfig);
		}

		public function set root(root:DisplayObject):void {
			mapValue(DisplayObject, root);
			live();
		}

	}
}
