package metalegs.mvcs.controller {
	import metalegs.base.reflection.Reflector;
	import metalegs.mvcs.reflection.MVCSReflection;

	public class DefaultControllerDetector implements ControllerDetector {

		private static const CONTROLLER_NAMESPACE:String = "controller";

		[Inject]
		public var reflector:Reflector;

		public function isController(type:Class):Boolean {

			var reflection:MVCSReflection = MVCSReflection(reflector.getReflection(type));

			return (reflection.instance() && hasControllerMetadata(reflection)) ||
					hasControllerClassName(reflection) ||
					reflection.hasLeafNamespace(CONTROLLER_NAMESPACE) ||
					reflection.hasAnyNamespace(CONTROLLER_NAMESPACE);
		}

		// todo: detect [Controller]
		private function hasControllerMetadata(reflection:MVCSReflection):Boolean {
			return false;
		}

		private function hasControllerClassName(reflection:MVCSReflection):Boolean {
			return reflection.fqn().search(/Controller$/) > 0;
		}
	}
}
