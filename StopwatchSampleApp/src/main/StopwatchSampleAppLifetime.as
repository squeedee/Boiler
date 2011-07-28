package main {
	import boiler.mvcs.MVCSLifetime;

	import flash.display.DisplayObject;

	import main.configuration.StopwatchConfiguration;

	public class StopwatchSampleAppLifetime extends MVCSLifetime {

		public function StopwatchSampleAppLifetime() {
			addConfigurationHandler(StopwatchConfiguration);
		}

		/**
		 * Boilerplate. the only one that feels like a nuisance..
		 * @param root
		 */
		public function set root(root:DisplayObject):void {
			if (hasMapping(DisplayObject))
				return;

			mapValue(DisplayObject, root);
			live();
		}

		public function get root():DisplayObject {
			return getInstance(DisplayObject);
		}

	}
}
