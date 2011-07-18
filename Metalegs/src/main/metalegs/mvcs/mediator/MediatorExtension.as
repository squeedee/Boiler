package metalegs.mvcs.mediator {
	import hookableSuspenders.handlers.mapping.AfterMapClassHandler;

	import metalegs.mvcs.displayInstanceFollower.StagePresence;

	import org.swiftsuspenders.InjectionConfig;

	public class MediatorExtension implements AfterMapClassHandler {

		[Inject]
		public var detector:MediatorDetector;

		[Inject]
		public var presence:StagePresence;

		public function afterMapClass(newConfig:InjectionConfig):void {
			handleMapping(newConfig.request)
		}

		public function handleMapping(type:Class):void {
			var viewType:Class = detector.mediatedViewType(type);

			if (viewType == null)
				return;

			presence.follow(viewType).withType(type);
		}

	}
}
