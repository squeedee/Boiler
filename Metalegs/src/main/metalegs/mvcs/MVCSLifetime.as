package metalegs.mvcs {
	import metalegs.base.Lifetime;
	import metalegs.mvcs.configuration.ConfigureController;
	import metalegs.mvcs.configuration.ConfigureDispatcher;
	import metalegs.mvcs.configuration.ConfigureMediator;
	import metalegs.mvcs.configuration.ConfigureNotifier;
	import metalegs.mvcs.configuration.ConfigureReflection;
	import metalegs.mvcs.configuration.ConfigureStagePresenceFollower;

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
