package metalegs.base {
	import metalegs.base.configuration.*;
	import metalegs.base.errors.ConfigurationCannotBeAddedError;
	import metalegs.base.errors.StartupCanOnlyBeRunOnceError;
	import metalegs.base.errors.TeardownAlreadyRunError;
	import metalegs.base.errors.TeardownCanOnlyRunAfterStartupError;

	internal class ConfigurationHandlerCollection {

		private var lifetime:Lifetime;
		private var setupHandlers:Array;
		private var teardownHandlers:Array;

		public function ConfigurationHandlerCollection(lifetime:Lifetime) {
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
			var handler:ConfigurationHandler = new (setupHandlers.shift())();
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
			var handler:ConfigurationHandler = teardownHandlers.shift();
			handler.teardown();
		}
	}
}
