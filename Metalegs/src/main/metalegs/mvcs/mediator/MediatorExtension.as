package metalegs.mvcs.mediator {
	import hookableSuspenders.handlers.mapping.AfterMapClassHandler;

	import metalegs.mvcs.displayInstanceFollower.StagePresence;

	import org.swiftsuspenders.InjectionConfig;

	/**
	 * Responsibility: (to be split)
	 *   1. Observe #mapClass for classes that meet the mediator criteria (MediatorDetector)
	 *	  2. Advise the 'instancer' of the signal->object-lifetime mapping. (MediatorMethodMapper)
	 */
	public class MediatorExtension implements AfterMapClassHandler {

		[Inject]
		public var presence:StagePresence;

		public function afterMapClass(newConfig:InjectionConfig):void {
			handleMapping(newConfig.request)
		}

		public function handleMapping(type:Class):void {

		}

	}
}
