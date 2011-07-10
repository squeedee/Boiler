package minilegs.hookableSuspenders {
	import org.swiftsuspenders.InjectionConfig;

	public class MappingHandlerCollection {
		private var injector:HookableInjector;

		public var beforeValueHandlers:Array = [];
		public var afterValueHandlers:Array = [];


		public function MappingHandlerCollection(injector:HookableInjector) {
			this.injector = injector;
		}

		public function add(handlerClass:Class):MappingHandlerCollection {
			var handler:* = instanceClass(handlerClass);

			if (handler is BeforeMapValueHandler)
				beforeValueHandlers.push(handler);

			if (handler is AfterMapValueHandler)
				afterValueHandlers.push(handler);

			return this;
		}

		internal function callBeforeMapValueHandlers(existingConfig:InjectionConfig, useValue:Object):void {
			for each (var handler:BeforeMapValueHandler in beforeValueHandlers) {
				handler.beforeMapValue(existingConfig,useValue);
			}
		}

		internal function callAfterMapValueHandlers(newConfig:InjectionConfig):void {
			for each (var handler:AfterMapValueHandler in afterValueHandlers) {
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
