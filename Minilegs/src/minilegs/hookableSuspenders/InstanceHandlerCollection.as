package minilegs.hookableSuspenders {
	public class InstanceHandlerCollection {

		private var beforeHandlers:Array = [];
		private var afterHandlers:Array = [];

		private var injector:HookableInjector;

		public function InstanceHandlerCollection(injector:HookableInjector) {
			this.injector = injector;
		}

		public function add(handlerType:Class):InstanceHandlerCollection {
			var handler:* = instanceClass(handlerType);

			if (handler is BeforeInstanceHandler) {
				beforeHandlers.push(handler);
				return this;
			}

			if (handler is AfterInstanceHandler) {
				afterHandlers.push(handler);
				return this;
			}

			throw new NotAnInstanceHandlerError(handlerType);
		}

		internal function callAfterHandlers(instance:*):void {
			for each (var handler:AfterInstanceHandler in afterHandlers) {
				handler.afterInstanced(instance);
			}
		}

		internal function callBeforeHandlers(type:Class):void {
			for each (var handler:BeforeInstanceHandler in beforeHandlers) {
				handler.beforeInstanced(type);
			}
		}

		private function instanceClass(handlerType:Class):* {
			if (!injector.hasMapping(handlerType))
				injector.mapSingleton(handlerType);
			injector.getInstance(handlerType);
		}

	}
}
