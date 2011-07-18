package metalegs.mvcs.mediator {
	import metalegs.mvcs.displayInstanceFollower.StagePresence;
	import metalegs.reflection.Reflection;
	import metalegs.reflection.Reflector;

	public class DefaultMediatorInstanceMapper implements MediatorInstanceMapper {

		[Inject]
		public var presence:StagePresence;

		[Inject]
		public var reflector:Reflector;

		public function mapMediator(type:Class):void {

			var viewType:Class = getViewTypeFromMediatorType(type);

			if (viewType == null)
				return;

			presence.follow(viewType).withType(type);

		}

		private function getViewTypeFromMediatorType(type:Class):Class {

			var mediatorReflection:Reflection = reflector.getReflection(type);

			return mediatorReflection.type().factory.method.(@name = VIEW_METHOD_NAME);

			return null;
		}
	}
}
