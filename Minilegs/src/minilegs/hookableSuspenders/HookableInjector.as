package minilegs.hookableSuspenders {
	import org.swiftsuspenders.InjectionConfig;
	import org.swiftsuspenders.Injector;

	/**
	 * SwiftSuspenders Instanciation is pretty easy to hook into, mapping isnt.
	 * This makes it a little simpler.
	 * Till says i wont need these with 2.0, look forward to it :D
	 */
	public class HookableInjector extends Injector {
		private var _instanceHandlers:InstanceHandlerCollection;
		private var _mappingHandlers:MappingHandlerCollection;

		public function HookableInjector(xmlConfig:XML = null) {
			super(xmlConfig);
			_instanceHandlers = new InstanceHandlerCollection(this);
			_mappingHandlers = new MappingHandlerCollection(this);
		}

		public function get instanceHandlers():InstanceHandlerCollection {
			return _instanceHandlers;
		}

		public function get mappingHandlers():MappingHandlerCollection {
			return _mappingHandlers;
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
			var previousConfig:InjectionConfig = getMapping(whenAskedFor, named);
			mappingHandlers.callBeforeMapValueHandlers(previousConfig, useValue);

			var newConfig:InjectionConfig = super.mapValue(whenAskedFor, useValue, named);

			mappingHandlers.callAfterMapValueHandlers(newConfig);

			return newConfig;
		}

		override public function mapClass(whenAskedFor:Class, instantiateClass:Class, named:String = ""):* {

			var previousConfig : InjectionConfig = getMapping(whenAskedFor, named);
			mappingHandlers.callBeforeMapClassHandlers(previousConfig, instantiateClass);

			var newConfig:InjectionConfig = super.mapClass(whenAskedFor, instantiateClass, named);

			mappingHandlers.callAfterMapClassHandlers(newConfig);

			return newConfig;
		}

		override public function mapSingletonOf(whenAskedFor:Class, useSingletonOf:Class, named:String = ""):* {
			var previousConfig : InjectionConfig = getMapping(whenAskedFor, named);
			mappingHandlers.callBeforeMapSingletonHandlers(previousConfig, useSingletonOf);

			var newConfig:InjectionConfig = super.mapSingletonOf(whenAskedFor, useSingletonOf, named);

			mappingHandlers.callAfterMapSingletonHandlers(newConfig);

			return newConfig;
		}

		override public function mapRule(whenAskedFor:Class, useRule:*, named:String = ""):* {
			return super.mapRule(whenAskedFor, useRule, named);
		}
	}
}
