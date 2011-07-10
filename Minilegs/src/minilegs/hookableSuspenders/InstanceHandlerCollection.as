package minilegs.hookableSuspenders {
	public class InstanceHandlerCollection {

		private var beforeHandlers:Array = [];
		private var afterHandlers:Array = [];

		private var injector:HookableInjector;

		public function InstanceHandlerCollection(injector:HookableInjector) {
			this.injector = injector;

		}

		public function add(handlerClass:Class):InstanceHandlerCollection {
			var handler:* = instanceClass(handlerClass);

			if (handler is BeforeInstanceHandler)
				beforeHandlers.push(handler);

			if (handler is AfterInstanceHandler)
				afterHandlers.push(handler);

			return this;
		}

		internal function callAfterHandlers(instance:*):void {
			for each (var handler:AfterInstanceHandler in afterHandlers) {
				handler.afterInstanced(instance);
			}
		}

		internal function callBeforeHandlers(clazz:Class):void {
			for each (var handler:BeforeInstanceHandler in beforeHandlers) {
				handler.beforeInstanced(clazz);
			}
		}

		private function instanceClass(handlerClass:Class):* {
			if (!injector.hasMapping(handlerClass))
				injector.mapSingleton(handlerClass);
			injector.getInstance(handlerClass);
		}

	}
}
