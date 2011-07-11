package metalegs.mvcs {
	import metalegs.base.Lifetime;
	import metalegs.mvcs.configuration.ConfigureController;
	import metalegs.mvcs.configuration.ConfigureReflection;

	public class MVCSLifetime extends Lifetime {

		public function MVCSLifetime() {
			addConfigurationHandler(ConfigureReflection);
			addConfigurationHandler(ConfigureController);
		}

	}
}
