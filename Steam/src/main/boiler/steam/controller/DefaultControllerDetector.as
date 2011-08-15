package boiler.steam.controller {
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;
	import boiler.reflection.helpers.NamespaceHelper;

	public class DefaultControllerDetector implements ControllerDetector {

		private static const CONTROLLER_NAMESPACE:String = "controller";
		private static const CONTROLLER_METADATA_NAME:String = "Controller";
		private static const CONTROLLER_CLASS_NAME_SUFFIX:RegExp = /Controller$/;

		private var namespaceHelper:NamespaceHelper;
		private var reflection:Reflection;

		[Inject]
		public var reflector:Reflector;

		public function isController(type:Class):Boolean {
			reflection = reflector.getReflection(type);
			namespaceHelper = new NamespaceHelper(reflection);

			return hasControllerMetadata() ||
					hasControllerClassNameSuffix() ||
					hasControllerNamespace()	;
		}

		private function hasControllerNamespace():Boolean {
			return namespaceHelper.hasAnyNamespace(CONTROLLER_NAMESPACE);
		}

		private function hasControllerClassNameSuffix():Boolean {
			return reflection.fqn().search(CONTROLLER_CLASS_NAME_SUFFIX) > 0;
		}

		private function hasControllerMetadata():Boolean {
			if (!reflection.instance())
				return false;

			return reflection.classMetadata().(@name == CONTROLLER_METADATA_NAME).length() > 0;
		}
	}
}
