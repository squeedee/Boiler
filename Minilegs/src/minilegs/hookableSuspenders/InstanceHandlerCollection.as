package minilegs.hookableSuspenders {
	public class InstanceHandlerCollection {

		private var handlers:Array = [];

		public function add(handler:InstanceHandler):void {
			handlers.push(handler)
		}

		public function afterInstanced(instance:*):void {
			for each (var handler:InstanceHandler in handlers) {
				handler.afterInstanced(instance);
			}
		}

		public function beforeInstance(clazz:Class):void {
			for each (var handler:InstanceHandler in handlers) {
				handler.beforeInstance(clazz);
			}

		}
	}
}
