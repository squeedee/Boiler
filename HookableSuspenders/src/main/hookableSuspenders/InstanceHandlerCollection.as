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

			var added:Boolean;
			added = addBeforeHandler(handler);
			added ||= addAfterHandler(handler);

			if (!added)
				throw new NotAnInstanceHandlerError(handlerType);

			return this;
		}

		private function addAfterHandler(handler:*):Boolean {
			if (!(handler is AfterInstanceHandler))
				return false;

			afterHandlers.push(handler);
			return true;
		}

		private function addBeforeHandler(handler:*):Boolean {
			if (! (handler is BeforeInstanceHandler))
				return false;

			beforeHandlers.push(handler);
			return true;
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
