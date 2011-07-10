package minilegs {
	import minilegs.base.Lifetime;
	import minilegs.configuration.MinilegsConfig;

	public class MinilegsLifetime extends Lifetime {

		public function MinilegsLifetime() {
			addConfigurationHandler(MinilegsConfig);
		}

	}
}
