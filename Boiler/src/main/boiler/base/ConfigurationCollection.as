package boiler.base {
	import boiler.base.configuration.*;
	import boiler.base.errors.ConfigurationCannotBeAddedError;
	import boiler.base.errors.StartupCanOnlyBeRunOnceError;
	import boiler.base.errors.TeardownAlreadyRunError;
	import boiler.base.errors.TeardownCanOnlyRunAfterStartupError;

	internal class ConfigurationCollection {

		private var lifetime:Lifetime;
		private var setupHandlers:Array;
		private var teardownHandlers:Array;

		public function ConfigurationCollection(lifetime:Lifetime) {
			this.lifetime = lifetime;
			setupHandlers = [];
		}

		public function add(handler:Class):void {
			if (hasStarted())
				throw new ConfigurationCannotBeAddedError();

			setupHandlers.push(handler);
		}

		public function startup():void {
			if (hasStarted())
				throw new StartupCanOnlyBeRunOnceError();

			teardownHandlers = [];

			while (setupHandlers.length > 0) {
				setupNextConfiguration();
			}

			setupHandlers = null;
		}

		private function setupNextConfiguration():void {
			var handler:Configuration = new (setupHandlers.shift())();
			lifetime.injectInto(handler);
			handler.startup();
			teardownHandlers.push(handler);
		}

		private function hasStarted():Boolean {
			return setupHandlers == null;
		}

		public function teardown():void {
			if (!hasStarted())
				throw new TeardownCanOnlyRunAfterStartupError();

			if (teardownHandlers == null)
				throw new TeardownAlreadyRunError();

			while (teardownHandlers.length > 0) {
				teardownNextConfiguration();
			}

			teardownHandlers = null;
		}

		private function teardownNextConfiguration():void {
			var handler:Configuration = teardownHandlers.shift();
			handler.teardown();
		}
	}
}
