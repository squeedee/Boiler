package minilegs.hookableSuspenders {
	import org.swiftsuspenders.Injector;

	/**
	 * SwiftSuspenders Instanciation is pretty easy to hook into, mapping isnt.
	 * This makes it a little simpler.
	 * Till says i wont need these with 2.0, look forward to it :D
	 */
	public class HookableInjector extends Injector {
		private var _instanceHandlers:InstanceHandlerCollection;

		public function HookableInjector(xmlConfig:XML = null) {
			super(xmlConfig);
			_instanceHandlers = new InstanceHandlerCollection(this);
		}

		public function get instanceHandlers():InstanceHandlerCollection {
			return _instanceHandlers;
		}

		// ************* Instancing Hook ************

		override public function instantiate(clazz:Class):* {

			instanceHandlers.callBeforeHandlers(clazz);

			var instance:* = super.instantiate(clazz);

			instanceHandlers.callAfterHandlers(instance);

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
