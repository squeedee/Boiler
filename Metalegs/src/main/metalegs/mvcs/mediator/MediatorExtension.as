package metalegs.mvcs.mediator {
	import flash.utils.getQualifiedClassName;

	import hookableSuspenders.handlers.mapping.AfterMapClassHandler;

	import metalegs.mvcs.displayInstanceFollower.StagePresence;

	import org.swiftsuspenders.InjectionConfig;

	public class MediatorExtension implements AfterMapClassHandler {

		[Inject]
		public var detector:MediatorDetector;

		[Inject]
		public var mapper:MediatorInstanceMapper;
		
		public function afterMapClass(newConfig:InjectionConfig):void {
			handleMapping(newConfig.request)
		}

		public function handleMapping(type:Class):void {
			if (! detector.isMediator(type))
				return;

			mapper.mapMediator(type);
		}

	}
}
