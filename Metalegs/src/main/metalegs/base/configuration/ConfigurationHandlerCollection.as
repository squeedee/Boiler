package metalegs.base.configuration {
	import flash.utils.getQualifiedClassName;

	import metalegs.base.*;

	public class ConfigurationHandlerCollection {

		private var lifetime:Lifetime;
		private var setupHandlers:Array;
		private var teardownHandlers:Array;

		public function ConfigurationHandlerCollection(lifetime:Lifetime) {
			this.lifetime = lifetime;
			setupHandlers = [];
		}

		public function add(handler:Class):void {
			if (hasStarted())
				throw new Error("You're too late");

			setupHandlers.push(handler);
		}

		public function startup():void {
			if (hasStarted())
				throw new Error("You can only live once");

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
				throw new Error("Only the good die young");

			while(teardownHandlers.length > 0) {
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
