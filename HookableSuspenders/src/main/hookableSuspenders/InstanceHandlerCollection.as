package hookableSuspenders {
	import hookableSuspenders.errors.NotAnInstanceHandlerError;
	import hookableSuspenders.handlers.instance.AfterInstanceHandler;
	import hookableSuspenders.handlers.instance.BeforeInstanceHandler;

	public class InstanceHandlerCollection {

		private var beforeHandlers:Array = [];
		private var afterHandlers:Array = [];

		private var injector:HookableInjector;

		public function InstanceHandlerCollection(injector:HookableInjector) {
			this.injector = injector;
		}

		public function add(handlerType:Class):InstanceHandlerCollection {
			var handler:* = instanceClass(handlerType);
			var foundType:Boolean = false;

			if (handler is BeforeInstanceHandler) {
				beforeHandlers.push(handler);
				foundType = true;
			}

			if (handler is AfterInstanceHandler) {
				afterHandlers.push(handler);
				foundType = true;
			}

			if (!foundType)
				throw new NotAnInstanceHandlerError(handlerType);

			return this;
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
			return injector.getInstance(handlerType);
		}

	}
}
