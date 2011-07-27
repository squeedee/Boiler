package boiler.mvcs {
	import boiler.base.Lifetime;
	import boiler.mvcs.configuration.ControllerConfiguration;
	import boiler.mvcs.configuration.DispatcherConfiguration;
	import boiler.mvcs.configuration.MediatorConfiguration;
	import boiler.mvcs.configuration.NotifierConfiguration;
	import boiler.mvcs.configuration.ReflectionConfiguration;
	import boiler.mvcs.configuration.StageObserverConfiguration;

	public class MVCSLifetime extends Lifetime {

		public function MVCSLifetime(xmlConfig:XML = null) {
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
