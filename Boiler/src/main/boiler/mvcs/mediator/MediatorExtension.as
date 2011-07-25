package boiler.mvcs.mediator {
	import flash.utils.getQualifiedClassName;

	import hookableSuspenders.handlers.mapping.AfterMapClassHandler;

	import boiler.mvcs.displayInstanceFollower.StagePresence;

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
			var viewType:Class = detector.getMediatedViewType(type);

			if (viewType == null)
				return;

			presence.follow(viewType).withType(type);
		}

	}
}
