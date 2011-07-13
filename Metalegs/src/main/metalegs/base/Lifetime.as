package metalegs.base {
	import hookableSuspenders.HookableInjector;

	import metalegs.base.configuration.ConfigurationHandlerCollection;

	public class Lifetime extends HookableInjector {
		private var configurationHandlers:ConfigurationHandlerCollection;

		public function Lifetime(xmlConfig:XML = null) {
			super(xmlConfig);
			mapValue(Lifetime, this);
			configurationHandlers = new ConfigurationHandlerCollection(this);
		}

		public function live():void {
			configurationHandlers.execute();
		}

		public function addConfigurationHandler(type:Class):Lifetime {
			configurationHandlers.add(type);
			return this;
		}

	}
}
