package minilegs.base {
	public class ConfigurationHandlerCollection {

		[Inject]
		public var reflector:Reflector;

		private var handlers:Array = [];

		private function getConfigurationHandler(handler:Object):Function {
			if (handler is Function)
				return Function(handler);

			if (handler is ConfigurationHandler)
				return ConfigurationHandler(handler).configure;

			throw new Error("That wont work.");
		}

		public function addConfigurationHandler(callback:*):void {
			handlers.push(callback);
		}

		public function execute():void {
			for each (var handler:Object in handlers) {
				getConfigurationHandler(handler)();
			}
		}
	}
}
