package boiler.steam {
	import boiler.base.Lifetime;
	import boiler.steam.configuration.ControllerConfiguration;
	import boiler.steam.configuration.DispatcherConfiguration;
	import boiler.steam.configuration.MediatorConfiguration;
	import boiler.steam.configuration.NotifierConfiguration;
	import boiler.steam.configuration.ReflectionConfiguration;
	import boiler.steam.configuration.StageObserverConfiguration;

	public class SteamLifetime extends Lifetime {

		public function SteamLifetime(xmlConfig:XML = null) {
			super(xmlConfig);
			addConfigurationHandler(ReflectionConfiguration);
			addConfigurationHandler(NotifierConfiguration);
			addConfigurationHandler(DispatcherConfiguration);
			addConfigurationHandler(ControllerConfiguration);
			addConfigurationHandler(StageObserverConfiguration);
			addConfigurationHandler(MediatorConfiguration);
		}

	}
}
