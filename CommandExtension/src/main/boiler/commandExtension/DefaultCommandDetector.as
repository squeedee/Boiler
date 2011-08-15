package boiler.commandExtension {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;
	import boiler.reflection.helpers.EventDrivenMethodHelper;
	import boiler.reflection.helpers.NamespaceHelper;

	public class DefaultCommandDetector implements CommandDetector {

		private static const CONTROLLER_NAMESPACE:String = "controller";
		private static const COMMAND_METHOD_NAME:String = "execute";
		private static const COMMAND_CLASS_NAME_SUFFIX:RegExp = /Command$/;

		private var namespaceHelper:NamespaceHelper;
		private var methodHelper:EventDrivenMethodHelper;

		[Inject]
		public var reflector:Reflector;

		[PostConstruct]
		public function setup():void {
			methodHelper = new EventDrivenMethodHelper(reflector);
		}

		public function isCommand(type:Class):Boolean {
			var reflection:Reflection = reflector.getReflection(type);
			namespaceHelper = new NamespaceHelper(reflection);

			return hasControllerNamespace(reflection) &&
					hasCommandSuffix(reflection) &&
					hasEventDrivenExecuteMethod(reflection);
		}

		private function hasCommandSuffix(reflection:Reflection):Boolean {
			return reflection.fqn().search(COMMAND_CLASS_NAME_SUFFIX) > 0;
		}

		private function hasEventDrivenExecuteMethod(reflection:Reflection):Boolean {

			var method:XML = reflection.findMethodByName(COMMAND_METHOD_NAME);

			if (method == null)
				return false;

			return methodHelper.isEventDrivenMethodDefinition(method);

		}

		private function hasControllerNamespace(reflection:Reflection):Boolean {
			return namespaceHelper.hasAnyNamespace(CONTROLLER_NAMESPACE);
		}
	}
}
