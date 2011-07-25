package boiler.mvcs.controller {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;

	public class DefaultControllerDetector implements ControllerDetector {

		private static const CONTROLLER_NAMESPACE:String = "controller";

		[Inject]
		public var reflector:Reflector;

		public function isController(type:Class):Boolean {

			var reflection:Reflection = reflector.getReflection(type);

			return (reflection.instance() && hasControllerMetadata(reflection)) ||
					hasControllerClassName(reflection) ||
					reflection.hasLeafNamespace(CONTROLLER_NAMESPACE) ||
					reflection.hasAnyNamespace(CONTROLLER_NAMESPACE);
		}

		private function hasControllerMetadata(reflection:Reflection):Boolean {
			return reflection.classMetadata().(@name == "Controller").length() > 0;
		}

		private function hasControllerClassName(reflection:Reflection):Boolean {
			return reflection.fqn().search(/Controller$/) > 0;
		}
	}
}
