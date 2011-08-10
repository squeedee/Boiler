package boiler.commandExtension {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;

	public class DefaultCommandDetector implements CommandDetector {

		private static const CONTROLLER_NAMESPACE:String = "controller";
		private static const COMMAND_METHOD_NAME:String = "execute";
		private static const COMMAND_CLASS_NAME_SUFFIX:RegExp = /Command$/;

		[Inject]
		public var reflector:Reflector;

		public function isCommand(type:Class):Boolean {

			var reflection:Reflection = reflector.getReflection(type);

			return hasControllerNamespace(reflection) &&
					hasPublicExecuteMethod(reflection) &&
					hasCommandSuffix(reflection);
		}

		private function hasCommandSuffix(reflection:Reflection):Boolean {
			return reflection.fqn().search(COMMAND_CLASS_NAME_SUFFIX) > 0;
		}

		private function hasPublicExecuteMethod(reflection:Reflection):Boolean {
			return reflection.type().factory.method.(@name == COMMAND_METHOD_NAME).length() == 1;
		}

		private function hasControllerNamespace(reflection:Reflection):Boolean {
			return reflection.hasAnyNamespace(CONTROLLER_NAMESPACE);
		}
	}
}
