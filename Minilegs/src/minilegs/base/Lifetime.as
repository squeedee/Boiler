package minilegs.base {
	import org.swiftsuspenders.Injector;

	public class Lifetime extends Injector {
		private var instanceHandlers:InstanceHandlerCollection = new InstanceHandlerCollection();
		private var configurationHandlers:ConfigurationHandlerCollection = new ConfigurationHandlerCollection();

		public function Lifetime(xmlConfig:XML = null) {
			super(xmlConfig);
			mapValue(Lifetime, this);
			mapSingleton(Reflector);
			injectInto(instanceHandlers);
			injectInto(configurationHandlers);
		}

		public function live():void {
			configurationHandlers.execute();
		}

		/**
		 * An instance handler is called any time a new class is instanced.
		 * It provides a simple way to add metadata support to any injector-handled class.
		 * @param callback
		 * @return
		 */
		public function addInstanceHandler(callback:*):Lifetime {
			instanceHandlers.addInstanceHandler(callback);
			return this;
		}

		// Hooking into SS's instanciation to power all the other hooks
		override public function instantiate(clazz:Class):* {
			var instance:* = super.instantiate(clazz);

			instanceHandlers.execute(clazz, instance);

			return instance;
		}

		public function addConfigurationHandler(callback:*):Lifetime {
			configurationHandlers.addConfigurationHandler(callback);
			return this;
		}

	}
}
