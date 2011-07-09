package minilegs.hookableSuspenders {
	import minilegs.hookableSuspenders.MappingHandler;

	public class MappingHandlerCollection {

		private var handlers:Array = [];

		public function execute():void {
			for each (var handler:MappingHandler in handlers) {
				handler.handleMapping();
			}
		}

		public function add(handler:InstanceHandler):void {
			handlers.push(handler)
		}	}
}
