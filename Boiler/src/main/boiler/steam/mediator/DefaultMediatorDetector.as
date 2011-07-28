package boiler.steam.mediator {
	import boiler.base.Lifetime;
	import boiler.steam.mediator.map.MediatorFactory;
	import boiler.reflection.ClassByInstanceCache;
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;

	import flash.utils.getDefinitionByName;

	public class DefaultMediatorDetector implements MediatorDetector {
		private static const MEDIATOR_NAMESPACE:String = "mediator";
		private static const VIEW_NAMESPACE:String = "view";
		private static const VIEW_REGISTER_METHOD_NAME:String = "register";
		private static const VIEW_DEREGISTER_METHOD_NAME:String = "deregister";

		private var reflection:Reflection;

		[Inject]
		public var lifetime:Lifetime;

		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var instanceCache:ClassByInstanceCache;

		public function getConfigurationFor(type:Class):MediatorFactory {
			reflection = reflector.getReflection(type);

			if (!isMediatorInName())
				return null;

			var viewType:Class = extractViewType();

			if (viewType == null)
				return null;

			var deregisterMethodName:String = getDeregisterMethodName();

			return new MediatorFactory(
					lifetime,
					type,
					viewType,
					VIEW_REGISTER_METHOD_NAME,
					deregisterMethodName
			);
		}

		private function getDeregisterMethodName():String {
			var descriptionList:XMLList = reflection.type().factory.method.(@name == VIEW_DEREGISTER_METHOD_NAME);

			if (descriptionList.length() == 0)
				return null;

			return VIEW_DEREGISTER_METHOD_NAME;

		}

		private function extractViewType():Class {
			var method:XML = getRegisterMethodDescription();

			if (method == null)
				return null;

			return Class(getDefinitionByName(method.parameter[0].@type.replace(/::/, ".")));
		}

		private function isMediatorInName():Boolean {

			return hasMediatorMetadata() ||
					hasMediatorClassName() ||
					reflection.hasLeafNamespace(MEDIATOR_NAMESPACE) ||
					reflection.hasLeafNamespace(VIEW_NAMESPACE) ||
					reflection.hasAnyNamespace(MEDIATOR_NAMESPACE) ||
					reflection.hasAnyNamespace(VIEW_NAMESPACE)
		}

		private function getRegisterMethodDescription():XML {

			var descriptionList:XMLList = reflection.type().factory.method.(@name == VIEW_REGISTER_METHOD_NAME);

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
