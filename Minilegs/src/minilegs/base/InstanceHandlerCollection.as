package minilegs.base {
	public class InstanceHandlerCollection {

		[Inject]
		public var reflector:Reflector;

		private var handlers:Array = [];

		private function getInstanceHandler(handler:Object):Function {
			if (handler is Function)
				return Function(handler);

			if (handler is InstanceHandler)
				return InstanceHandler(handler).handleInstance;

			throw new Error("That wont work.")
		}

		public function addInstanceHandler(callback:*):void {
			handlers.push(callback);
		}

		public function execute(clazz:Class, instance:*):void {
			if (reflector == null) // Fixme: this is ugly awareness, the Lifetime must be injecting into us as we speak :D
				return;

			var reflection:Reflection = reflector.getReflection(clazz);

			for each (var handler:Object in handlers) {
				getInstanceHandler(handler)(reflection, instance);
			}
		}
	}
}
