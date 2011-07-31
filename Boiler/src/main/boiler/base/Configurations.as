package boiler.base {
	import boiler.base.configuration.Configuration;
	import boiler.base.errors.TeardownAlreadyRunError;

	internal class Configurations {

		private var lifetime:Lifetime;
		private var configurations:Array;
		private var teardownConfigurations:Array;

		public function Configurations(lifetime:Lifetime) {
			this.lifetime = lifetime;
			configurations = [];
			teardownConfigurations = [];
		}

		/**
		 * @todo I'm not sure this unfolds the teardowns correctly. Might need to store a tree instead.
		 * @param configuration
		 */
		public function run(configuration:*):void {
			var configurationInstance:Configuration = ensureInstance(configuration);

			configurations.push(configurationInstance);
			startConfiguration(configurationInstance);
			teardownConfigurations.push(configurations.pop());

		}

		private function startConfiguration(configurationInstance:Configuration):void {
			lifetime.injectInto(configurationInstance);
			configurationInstance.startup();
		}

		private function ensureInstance(configuration:*):Configuration {
			if (configuration is Configuration)
				return configuration;

			return Configuration(new configuration());
		}

		public function teardown():void {
			if (teardownConfigurations == null)
				throw new TeardownAlreadyRunError();

			while (teardownConfigurations.length > 0) {
				teardownNextConfiguration();
			}

			teardownConfigurations = null;
		}

		private function teardownNextConfiguration():void {
			var handler:Configuration = teardownConfigurations.shift();
			handler.teardown();
		}
	}
}
