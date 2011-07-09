package minilegs.hookableSuspenders {
	import org.swiftsuspenders.Injector;

	/**
	 * SwiftSuspenders Instanciation is pretty easy to hook into, mapping isnt.
	 * This makes it a little simpler.
	 * Till says i wont need these with 2.0, look forward to it :D
	 */
	public class HookableInjector extends Injector {
		private var instanceHandlers:InstanceHandlerCollection;


		public function HookableInjector(xmlConfig:XML = null) {
			super(xmlConfig);
			instanceHandlers = new InstanceHandlerCollection();
		}

		// ************* Instancing Hook ************

		/**
		 * An instance handler is called any time a new class is instanced.
		 * It provides a simple way to add metadata support to any injector-handled class.
		 * @param handler
		 * @return
		 */
		public function addInstanceHandler(handler:InstanceHandler):HookableInjector {
			instanceHandlers.add(handler);
			return this;
		}

		public function createInstanceHandler(handlerClass:Class):HookableInjector {
			if (!hasMapping(handlerClass))
				mapSingleton(handlerClass);
			instanceHandlers.add(getInstance(handlerClass));
			return this;
		}

		// Hooking into SS's instanciation to power all the other hooks
		override public function instantiate(clazz:Class):* {

			instanceHandlers.beforeInstance(clazz);

			var instance:* = super.instantiate(clazz);

			instanceHandlers.afterInstanced(instance);

			return instance;
		}

		// ************* Mapping Hook ************

		override public function mapValue(whenAskedFor:Class, useValue:Object, named:String = ""):* {
			return super.mapValue(whenAskedFor, useValue, named);
		}

		override public function mapClass(whenAskedFor:Class, instantiateClass:Class, named:String = ""):* {
			return super.mapClass(whenAskedFor, instantiateClass, named);
		}

		override public function mapSingletonOf(whenAskedFor:Class, useSingletonOf:Class, named:String = ""):* {
			return super.mapSingletonOf(whenAskedFor, useSingletonOf, named);
		}

		override public function mapRule(whenAskedFor:Class, useRule:*, named:String = ""):* {
			return super.mapRule(whenAskedFor, useRule, named);
		}

	}
}
