package metalegs.mvcs {
	import metalegs.base.Lifetime;
	import metalegs.mvcs.configuration.ConfigureController;
	import metalegs.mvcs.configuration.ConfigureDispatcher;
	import metalegs.mvcs.configuration.ConfigureNotifier;
	import metalegs.mvcs.configuration.ConfigureReflection;

	public class MVCSLifetime extends Lifetime {

		public function MVCSLifetime() {
			addConfigurationHandler(ConfigureReflection);
			addConfigurationHandler(ConfigureNotifier);
			addConfigurationHandler(ConfigureDispatcher);
			addConfigurationHandler(ConfigureController);
		}

	}
}
