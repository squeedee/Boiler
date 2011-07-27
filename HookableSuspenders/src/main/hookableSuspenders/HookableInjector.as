package hookableSuspenders {
	import org.swiftsuspenders.InjectionConfig;
	import org.swiftsuspenders.Injector;

	/**
	 * This class enables you to run handlers before and after every mapping or instanciation through Swiftsuspenders.
	 *
	 * Till S. says we wont need these with 2.0, look forward to it :D
	 *
	 * For now. Here's the rub.
	 *
	 * Use the HookableInjector where you would use Injector.
	 *
	 * To add handlers, use the methods of instanceHandlers() and mappingHandlers().
	 *
	 * @author Rasheed Abdul-Aziz
	 * @license MIT
	 *
	 * @todo : unmapping!
	 */
	public class HookableInjector extends Injector {
		private var _instanceHandlers:InstanceHandlerCollection;
		private var _mappingHandlers:MappingHandlerCollection;

		/**
		 * @inherit
		 */
		public function HookableInjector(xmlConfig:XML = null) {
			super(xmlConfig);
			_instanceHandlers = new InstanceHandlerCollection(this);
			_mappingHandlers = new MappingHandlerCollection(this);
		}

		/**
		 * Access to the Instance Handler collection for this Injector. These handlers respond to instanciation through
		 * SwiftSuspenders
		 */
		public function get instanceHandlers():InstanceHandlerCollection {
			return _instanceHandlers;
		}

		/**
		 * Access to the Mapping Handler collection for this Injector. These handlers respond to mapping of classes,
		 * values and singletons with SwiftSuspenders
		 */
		public function get mappingHandlers():MappingHandlerCollection {
			return _mappingHandlers;
		}

		// ************* Instancing Hook ************

		/**
		 * @inherit
		 */
		override public function instantiate(type:Class):* {

			instanceHandlers.callBeforeHandlers(type);

			var instance:* = super.instantiate(type);

			instanceHandlers.callAfterHandlers(instance);

			return instance;
		}

		// ************* Mapping Hook ************

		/**
		 * @inherit
		 *
		 * Before the mapping is complete, the BeforeMapValueHandler's in the mappingHandlers collection are called
		 *
		 * After the mapping is complete, the AfterMapValueHandler's in the mapping handlers collection are called
		 *
		 */
		override public function mapValue(whenAskedFor:Class, useValue:Object, named:String = ""):* {
			var previousConfig:InjectionConfig = getMapping(whenAskedFor, named);
			mappingHandlers.callBeforeMapValueHandlers(previousConfig, useValue);

			var newConfig:InjectionConfig = super.mapValue(whenAskedFor, useValue, named);

			mappingHandlers.callAfterMapValueHandlers(newConfig);

			return newConfig;
		}

		/**
		 * @inherit
		 *
		 * Before the mapping is complete, the BeforeMapClassHandler's in the mappingHandlers collection are called
		 *
		 * After the mapping is complete, the AfterMapClassHandler's in the mapping handlers collection are called
		 *
		 */
		override public function mapClass(whenAskedFor:Class, instantiateClass:Class, named:String = ""):* {

			var previousConfig:InjectionConfig = getMapping(whenAskedFor, named);
			mappingHandlers.callBeforeMapClassHandlers(previousConfig, instantiateClass);

			var newConfig:InjectionConfig = super.mapClass(whenAskedFor, instantiateClass, named);

			mappingHandlers.callAfterMapClassHandlers(newConfig);

			return newConfig;
		}

		/**
		 * @inherit
		 *
		 * Before the mapping is complete, the BeforeMapSingletonHandler's in the mappingHandlers collection are called
		 *
		 * After the mapping is complete, the AfterMapSingletonHandler's in the mapping handlers collection are called
		 *
		 */
		override public function mapSingletonOf(whenAskedFor:Class, useSingletonOf:Class, named:String = ""):* {
			var previousConfig:InjectionConfig = getMapping(whenAskedFor, named);
			mappingHandlers.callBeforeMapSingletonHandlers(previousConfig, useSingletonOf);

			var newConfig:InjectionConfig = super.mapSingletonOf(whenAskedFor, useSingletonOf, named);

			mappingHandlers.callAfterMapSingletonHandlers(newConfig);

			return newConfig;
		}

	}
}
