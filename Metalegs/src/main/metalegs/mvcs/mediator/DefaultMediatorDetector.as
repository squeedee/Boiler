package metalegs.mvcs.mediator {
	import flash.utils.getDefinitionByName;

	import metalegs.reflection.ClassByInstanceCache;

	import metalegs.reflection.Reflection;
	import metalegs.reflection.Reflector;

	public class DefaultMediatorDetector implements MediatorDetector {
		private static const MEDIATOR_NAMESPACE:String = "mediator";
		private static const VIEW_NAMESPACE:String = "view";
		private static const VIEW_METHOD_NAME:String = "register";

		private var reflection:Reflection;

		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var instanceCache:ClassByInstanceCache;

		public function mediatedViewType(type:Class):Class {
			reflection = reflector.getReflection(type);

			if (!isMediator())
				return null;

			return extractClassFromMethod();
		}

		private function extractClassFromMethod():Class {
			var method:XML = getRegisterMethodDescription();

			if (method == null)
				return null;

			return Class(getDefinitionByName(method.parameter[0].@type.replace(/::/,".")));
		}

		public function isMediator():Boolean {

			return hasMediatorMetadata() ||
					hasMediatorClassName() ||
					reflection.hasLeafNamespace(MEDIATOR_NAMESPACE) ||
					reflection.hasLeafNamespace(VIEW_NAMESPACE) ||
					reflection.hasAnyNamespace(MEDIATOR_NAMESPACE) ||
					reflection.hasAnyNamespace(VIEW_NAMESPACE)
		}


		private function getRegisterMethodDescription():XML {
			var descriptionList:XMLList = reflection.type().factory.method.(@name = VIEW_METHOD_NAME);
			if (descriptionList.length() == 0)
				return null;

			return descriptionList[0];

		}

		private function hasMediatorMetadata():Boolean {
			if (!reflection.instance())
				return false;

			return reflection.classMetadata().(@name == "Mediator").length() > 0;
		}

		private function hasMediatorClassName():Boolean {
			return reflection.fqn().search(/Mediator$/) > 0;
		}
	}
}
