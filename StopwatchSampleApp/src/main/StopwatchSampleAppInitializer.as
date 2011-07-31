package main {
	import boiler.base.Initializer;
	import boiler.base.Lifetime;

	import flash.display.DisplayObject;

	import main.configuration.StopwatchConfiguration;

	public class StopwatchSampleAppInitializer implements Initializer {

		private var root:DisplayObject;

		public function StopwatchSampleAppInitializer(root:DisplayObject) {
			this.root = root;
		}

		public function run(lifetime:Lifetime):void {
			lifetime.runConfiguration(StopwatchConfiguration);
			lifetime.mapValue(DisplayObject, root);
		}
	}
}
