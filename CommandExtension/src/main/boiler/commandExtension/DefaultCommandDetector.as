package boiler.commandExtension {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;
	import boiler.reflection.helpers.SimpleEventClassHelper;

	import flash.utils.getDefinitionByName;

	public class DefaultCommandDetector implements CommandDetector {

		private static const CONTROLLER_NAMESPACE:String = "controller";
		private static const COMMAND_METHOD_NAME:String = "execute";
		private static const COMMAND_CLASS_NAME_SUFFIX:RegExp = /Command$/;

		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var eventClassHelper:SimpleEventClassHelper;

		public function isCommand(type:Class):Boolean {

			var reflection:Reflection = reflector.getReflection(type);

			return hasControllerNamespace(reflection) &&
					hasCommandSuffix(reflection) &&
					hasSimpleEventExecuteMethod(reflection);
		}

		private function hasCommandSuffix(reflection:Reflection):Boolean {
			return reflection.fqn().search(COMMAND_CLASS_NAME_SUFFIX) > 0;
		}

		private function hasSimpleEventExecuteMethod(reflection:Reflection):Boolean {
			var methods:XMLList = getExecuteMethods(reflection);

			if (methods.length() != 1)
				return false;

			var method:XML = methods[0];

			if (method.parameters.length() != 1)
				return false;

			var eventType:Class = Class(getDefinitionByName(method.parameters[0].type));

			return false;

			eventClassHelper.isSimpleEvent(methods.length())


		}

		private function getExecuteMethods(reflection:Reflection):* {
			return reflection.type().factory.method.(@name == COMMAND_METHOD_NAME);
		}

		private function hasControllerNamespace(reflection:Reflection):Boolean {
			return reflection.hasAnyNamespace(CONTROLLER_NAMESPACE);
		}
	}
}
