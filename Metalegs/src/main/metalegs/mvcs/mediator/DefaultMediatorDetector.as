package metalegs.mvcs.mediator {
	import metalegs.reflection.Reflection;
	import metalegs.reflection.Reflector;

	public class DefaultMediatorDetector implements MediatorDetector {
		private static const MEDIATOR_NAMESPACE:String = "mediator";
		private static const VIEW_NAMESPACE:String = "view";

		[Inject]
		public var reflector:Reflector;

		public function isMediator(type:Class):Boolean {
			var reflection:Reflection = reflector.getReflection(type);

			return (reflection.instance() && hasMediatorMetadata(reflection)) ||
					hasMediatorClassName(reflection) ||
					reflection.hasLeafNamespace(MEDIATOR_NAMESPACE) ||
					reflection.hasLeafNamespace(VIEW_NAMESPACE) ||
					reflection.hasAnyNamespace(MEDIATOR_NAMESPACE) ||
					reflection.hasAnyNamespace(VIEW_NAMESPACE);
		}

		private function hasMediatorMetadata(reflection:Reflection):Boolean {
			return reflection.classMetadata().(@name == "Mediator").length() > 0;
		}

		private function hasMediatorClassName(reflection:Reflection):Boolean {
			return reflection.fqn().search(/Mediator$/) > 0;
		}
	}
}
