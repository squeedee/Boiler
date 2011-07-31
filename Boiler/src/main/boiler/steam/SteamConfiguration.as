package boiler.steam {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.steam.configuration.ControllerConfiguration;
	import boiler.steam.configuration.DispatcherConfiguration;
	import boiler.steam.configuration.MediatorConfiguration;
	import boiler.steam.configuration.NotifierConfiguration;
	import boiler.steam.configuration.ReflectionConfiguration;
	import boiler.steam.configuration.StageObserverConfiguration;

	public class SteamConfiguration extends ConfigurationBase {

		override public function startup():void {
			lifetime
					.runConfiguration(ReflectionConfiguration)
					.runConfiguration(NotifierConfiguration)
					.runConfiguration(DispatcherConfiguration)
					.runConfiguration(ControllerConfiguration)
					.runConfiguration(StageObserverConfiguration)
					.runConfiguration(MediatorConfiguration);
		}

	}
}
