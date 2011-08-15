package boiler.steam.mediator {
	import boiler.base.Lifetime;
	import boiler.reflection.ClassByInstanceCache;
	import boiler.reflection.Reflection;
	import boiler.reflection.Reflector;
	import boiler.reflection.helpers.NamespaceHelper;
	import boiler.steam.mediator.map.MediatorFactory;

	import flash.utils.getDefinitionByName;

	// Fixme : this is a mess! Most of this should be 'help'
	public class DefaultMediatorDetector implements MediatorDetector {
		private static const MEDIATOR_NAMESPACE:String = "mediator";
		private static const VIEW_NAMESPACE:String = "view";
		private static const VIEW_REGISTER_METHOD_NAME:String = "register";
		private static const VIEW_DEREGISTER_METHOD_NAME:String = "deregister";

		private var reflection:Reflection;
		private var namespaceHelper:NamespaceHelper;

		[Inject]
		public var lifetime:Lifetime;

		[Inject]
		public var reflector:Reflector;

		[Inject]
		public var instanceCache:ClassByInstanceCache;

		public function getConfigurationFor(type:Class):MediatorFactory {
			getReflection(type);
			
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

		private function getReflection(type:Class):void {
			reflection = reflector.getReflection(type);
			namespaceHelper = new NamespaceHelper(reflection);
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
					namespaceHelper.hasLeafNamespace(MEDIATOR_NAMESPACE) ||
					namespaceHelper.hasLeafNamespace(VIEW_NAMESPACE) ||
					namespaceHelper.hasAnyNamespace(MEDIATOR_NAMESPACE) ||
					namespaceHelper.hasAnyNamespace(VIEW_NAMESPACE)
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
