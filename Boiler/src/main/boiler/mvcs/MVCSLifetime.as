package boiler.mvcs {
	import boiler.base.Lifetime;
	import boiler.mvcs.configuration.ConfigureController;
	import boiler.mvcs.configuration.ConfigureDispatcher;
	import boiler.mvcs.configuration.ConfigureMediator;
	import boiler.mvcs.configuration.ConfigureNotifier;
	import boiler.mvcs.configuration.ConfigureReflection;
	import boiler.mvcs.configuration.ConfigureStagePresenceFollower;

	public class MVCSLifetime extends Lifetime {

		public function MVCSLifetime(xmlConfig:XML = null) {
			super(xmlConfig);
			addConfigurationHandler(ConfigureReflection);
			addConfigurationHandler(ConfigureNotifier);
			addConfigurationHandler(ConfigureDispatcher);
			addConfigurationHandler(ConfigureController);
			addConfigurationHandler(ConfigureStagePresenceFollower);
			addConfigurationHandler(ConfigureMediator);
		}

	}
}
