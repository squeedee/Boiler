package metalegs.mvcs.mediator {
	import flash.utils.getDefinitionByName;

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

			var byName:Class = viewByName(mediatorReflection.fqn());
			if (byName)
				return byName;

			// todo: support [Inject] p-v anying:DO
			//var byInjectedProperty

			return null;
		}

		private function viewByName(name:String):Class {
			return Class(
					getDefinitionByName(name.replace(/\.([^.]*)Mediator$/, ".$1"))
					||
					getDefinitionByName(name.replace(/\.([^.]*)Mediator$/, ".$1View"))
			);
		}
	}
}
