package minilegs.hookableSuspenders {
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

		public function add(handlerClass:Class):MappingHandlerCollection {
			var handler:* = instanceClass(handlerClass);

			if (handler is BeforeMapValueHandler)
				beforeValueHandlers.push(handler);

			if (handler is AfterMapValueHandler)
				afterValueHandlers.push(handler);

			if (handler is BeforeMapClassHandler)
				beforeClassHandlers.push(handler);

			if (handler is AfterMapClassHandler)
				afterClassHandlers.push(handler);

			if (handler is BeforeMapSingletonHandler)
				beforeSingletonHandlers.push(handler);

			if (handler is AfterMapSingletonHandler)
				afterSingletonHandlers.push(handler);

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
				handler.beforeMapValue(existingConfig, instanciateClass);
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
				handler.afterMapValue(newConfig);
			}

		}

		private function instanceClass(handlerClass:Class):* {
			if (!injector.hasMapping(handlerClass))
				injector.mapSingleton(handlerClass);
			injector.getInstance(handlerClass);
		}
	}
}
