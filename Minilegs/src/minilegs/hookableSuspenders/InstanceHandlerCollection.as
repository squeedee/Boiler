package minilegs.hookableSuspenders {
	public class InstanceHandlerCollection {

		private var beforeHandlers:Array = [];
		private var afterHandlers:Array = [];

		private var _injector:HookableInjector;

		public function InstanceHandlerCollection(injector:HookableInjector) {
			_injector = injector;

		}

		public function add(handlerClass:Class):InstanceHandlerCollection {
			var handler:* = instanceClass(handlerClass);

			if (handler is BeforeInstance)
				beforeHandlers.push(handler);
			if (handler is AfterInstance)
				afterHandlers.push(handler);
			return this;
		}

		internal function callAfterHandlers(instance:*):void {
			for each (var handler:AfterInstance in afterHandlers) {
				handler.afterInstanced(instance);
			}
		}

		internal function callBeforeHandlers(clazz:Class):void {
			for each (var handler:BeforeInstance in beforeHandlers) {
				handler.beforeInstanced(clazz);
			}
		}

		private function instanceClass(handlerClass:Class):* {
			if (!_injector.hasMapping(handlerClass))
				_injector.mapSingleton(handlerClass);
			_injector.getInstance(handlerClass);
		}

	}
}
