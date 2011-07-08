package minilegs {
	import minilegs.base.Lifetime;
	import minilegs.configuration.configurationHandlers.MinilegsConfig;

	public class MinilegsLifetime extends Lifetime {

		public function MinilegsLifetime() {
			super();
			addConfigurationHandler()
		}

	}
}
