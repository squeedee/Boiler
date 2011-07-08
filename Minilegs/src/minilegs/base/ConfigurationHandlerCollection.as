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
			if (handlers == null)
				throw new Error("You're too late");

			handlers.push(callback);
		}

		public function execute():void {
			while (handlers.length > 0) {
				getConfigurationHandler(handlers.shift()).call();
			}

			handlers = null;
		}
	}
}
