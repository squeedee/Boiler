package minilegs.base {
	import org.swiftsuspenders.Injector;

	public class Lifetime extends Injector {

		private var reflector:Reflector = new Reflector();
		private var instanceHandlers:InstanceHandlers = new InstanceHandlers();
		private var configurationHandlers

		public function Lifetime() {
			mapValue(Reflector, reflector);
			injectInto(instanceHandlers);
		}

		public function live():void {

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



	}
}
