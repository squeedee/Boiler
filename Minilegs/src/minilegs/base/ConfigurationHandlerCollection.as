package minilegs.base {
	public class ConfigurationHandlerCollection {

		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var lifetime:Lifetime;

		private var handlers:Array = [];

		private function getConfigurationHandler(handler:Object):Function {
			if (handler is Class)
				return instanceHandlerClass(Class(handler)).configure;

			if (handler is Function)
				return Function(handler);

			throw new Error("That wont work.");
		}

		private function instanceHandlerClass(clazz:Class):ConfigurationHandler {
			var configurationHandler:ConfigurationHandler = new clazz();
			lifetime.injectInto(configurationHandler);
			return configurationHandler;
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
