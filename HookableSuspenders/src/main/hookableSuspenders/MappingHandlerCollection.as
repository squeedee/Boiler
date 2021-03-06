package hookableSuspenders {
	import hookableSuspenders.errors.NotAMappingHandlerError;
	import hookableSuspenders.handlers.mapping.AfterMapClassHandler;
	import hookableSuspenders.handlers.mapping.AfterMapSingletonHandler;
	import hookableSuspenders.handlers.mapping.AfterMapValueHandler;
	import hookableSuspenders.handlers.mapping.BeforeMapClassHandler;
	import hookableSuspenders.handlers.mapping.BeforeMapSingletonHandler;
	import hookableSuspenders.handlers.mapping.BeforeMapValueHandler;

	import org.swiftsuspenders.InjectionConfig;

	public class MappingHandlerCollection {
		private var injector:HookableInjector;

		private var beforeValueHandlers:Array = [];
		private var afterValueHandlers:Array = [];
		private var beforeClassHandlers:Array = [];
		private var afterClassHandlers:Array = [];
		private var beforeSingletonHandlers:Array = [];
		private var afterSingletonHandlers:Array = [];

		public function MappingHandlerCollection(injector:HookableInjector) {
			this.injector = injector;
		}

		public function add(handlerType:Class):MappingHandlerCollection {
			var handler:* = instanceClass(handlerType);
			var foundType:Boolean = false;

			if (handler is BeforeMapValueHandler) {
				beforeValueHandlers.push(handler);
				foundType = true
			}

			if (handler is AfterMapValueHandler) {
				afterValueHandlers.push(handler);
				foundType = true
			}

			if (handler is BeforeMapClassHandler) {
				beforeClassHandlers.push(handler);
				foundType = true
			}

			if (handler is AfterMapClassHandler) {
				afterClassHandlers.push(handler);
				foundType = true
			}

			if (handler is BeforeMapSingletonHandler) {
				beforeSingletonHandlers.push(handler);
				foundType = true
			}

			if (handler is AfterMapSingletonHandler) {
				afterSingletonHandlers.push(handler);
				foundType = true
			}

			if (!foundType)
				throw new NotAMappingHandlerError(handlerType);

			return this;
		}

		internal function callBeforeMapValueHandlers(existingConfig:InjectionConfig, useValue:Object):void {
			for each (var handler:BeforeMapValueHandler in beforeValueHandlers) {
				handler.beforeMapValue(existingConfig, useValue);
			}
		}

		internal function callAfterMapValueHandlers(newConfig:InjectionConfig):void {
			for each (var handler:AfterMapValueHandler in afterValueHandlers) {
				handler.afterMapValue(newConfig);
			}
		}

		internal function callBeforeMapClassHandlers(existingConfig:InjectionConfig, instanciateClass:Class):void {
			for each (var handler:BeforeMapClassHandler in beforeClassHandlers) {
				handler.beforeMapClass(existingConfig, instanciateClass);
			}
		}

		internal function callAfterMapClassHandlers(newConfig:InjectionConfig):void {
			for each (var handler:AfterMapClassHandler in afterClassHandlers) {
				handler.afterMapClass(newConfig);
			}

		}

		internal function callBeforeMapSingletonHandlers(existingConfig:InjectionConfig, useSingletonOf:Class):void {
			for each (var handler:BeforeMapSingletonHandler in beforeSingletonHandlers) {
				handler.beforeMapSingleton(existingConfig, useSingletonOf);
			}
		}

		internal function callAfterMapSingletonHandlers(newConfig:InjectionConfig):void {
			for each (var handler:AfterMapSingletonHandler in afterSingletonHandlers) {
				handler.afterMapSingleton(newConfig);
			}
		}

		private function instanceClass(handlerClass:Class):* {
			if (!injector.hasMapping(handlerClass))
				injector.mapSingleton(handlerClass);
			return injector.getInstance(handlerClass);
		}

		public function remove(handlerType:Class):void {
			if (injector.hasMapping(handlerType))
				injector.unmap(handlerType);

			// @todo still need to take the handler instance out of the appropriate handler list
			// @todo will probable need a mapping to find them quickly.

		}
	}
}
