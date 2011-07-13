package metalegs.base.configuration {
	import flash.utils.getQualifiedClassName;

	import metalegs.base.*;

	public class ConfigurationHandlerCollection {

		private var lifetime:Lifetime;
		private var handlers:Array;

		public function ConfigurationHandlerCollection(lifetime:Lifetime) {
			this.lifetime = lifetime;
			handlers = [];
		}

		public function add(handler:Class):void {
			if (handlers == null)
				throw new Error("You're too late");

			handlers.push(handler);
		}

		public function execute():void {
			var handler:ConfigurationHandler;

			while (handlers.length > 0) {
				handler = new (handlers.shift())();
				trace("::::CONFIGURE HANDLER: " + getQualifiedClassName(handler));
				lifetime.injectInto(handler);
				handler.configure();
			}

			handlers = null;
		}
	}
}
