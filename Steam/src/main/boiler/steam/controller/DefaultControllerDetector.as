package boiler.steam.controller {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;

	public class DefaultControllerDetector implements ControllerDetector {

		private static const CONTROLLER_NAMESPACE:String = "controller";
		private static const CONTROLLER_METADATA_NAME:String = "Controller";
		private static const CONTROLLER_CLASS_NAME_SUFFIX:RegExp = /Controller$/;

		[Inject]
		public var reflector:Reflector;

		public function isController(type:Class):Boolean {
			var reflection:Reflection = reflector.getReflection(type);

			return hasControllerMetadata(reflection) ||
					hasControllerClassNameSuffix(reflection) ||
					hasControllerNamespace(reflection)	;
		}

		private function hasControllerNamespace(reflection:Reflection):Boolean {
			return reflection.hasAnyNamespace(CONTROLLER_NAMESPACE);
		}

		private function hasControllerMetadata(reflection:Reflection):Boolean {
			if (!reflection.instance())
				return false;

			return reflection.classMetadata().(@name == CONTROLLER_METADATA_NAME).length() > 0;
		}

		private function hasControllerClassNameSuffix(reflection:Reflection):Boolean {
			return reflection.fqn().search(CONTROLLER_CLASS_NAME_SUFFIX) > 0;
		}
	}
}
