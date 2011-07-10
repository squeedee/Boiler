package metalegs.mvcs {
	import metalegs.base.Lifetime;
	import metalegs.mvcs.configuration.MVCSConfiguration;

	public class MVCSLifetime extends Lifetime {

		public function MVCSLifetime() {
			addConfigurationHandler(MVCSConfiguration);
		}

	}
}
