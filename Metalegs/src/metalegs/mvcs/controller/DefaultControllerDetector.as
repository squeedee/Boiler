package metalegs.mvcs.controller {
	import metalegs.mvcs.reflection.MVCSReflection;

	public class DefaultControllerDetector implements ControllerDetector {

		private static const CONTROLLER_NAMESPACE:String = "controller";

		public function isController(reflection:MVCSReflection):Boolean {
			return hasControllerMetadata(reflection) ||
					hasControllerClassName(reflection) ||
					reflection.hasLeafNamespace(CONTROLLER_NAMESPACE) ||
					reflection.hasAnyNamespace(CONTROLLER_NAMESPACE);
		}

		private function hasControllerMetadata(reflection:MVCSReflection):Boolean {
			return false;
		}

		private function hasControllerClassName(reflection:MVCSReflection):Boolean {
			return reflection.fqn().search(/Controller$/) > 0;
		}
	}
}
