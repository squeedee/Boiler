package boiler.mvcs.mediator {
	import boiler.base.Lifetime;
	import boiler.mvcs.mediator.MediatorDetector;
	import boiler.mvcs.mediator.map.MediatorFactory;
	import boiler.mvcs.mediator.map.MediatorMap;
	import boiler.mvcs.stageObserver.StageObserver;

	import flash.display.DisplayObject;
	import flash.utils.getQualifiedClassName;

	import hookableSuspenders.handlers.mapping.AfterMapClassHandler;

	import org.swiftsuspenders.InjectionConfig;

	public class MediatorExtension implements AfterMapClassHandler {

		[Inject]
		public var detector:MediatorDetector;

		[Inject]
		public var lifetime:Lifetime;

		[Inject]
		public var observer:StageObserver;

		[Inject]
		public var instanceHandler:ViewInstanceHandler;

		[Inject]
		public var mediatorMap:MediatorMap;

		[PostConstruct]
		public function setup():void {
			configureObserver();
			configureInstanceHandler();
		}

		public function afterMapClass(newConfig:InjectionConfig):void {
			handleMapping(newConfig.request)
		}

		public function handleMapping(type:Class):void {
			var config:MediatorFactory = detector.getConfigurationFor(type);

			if (config == null)
				return;

			mediatorMap.mapFactory(config);
		}

		private function configureObserver():void {
			if (!lifetime.hasMapping(DisplayObject))
				return;

			const displayRoot:DisplayObject = lifetime.getInstance(DisplayObject);

			observer.setDisplayRoot(displayRoot).setHandler(instanceHandler);

		}

		private function configureInstanceHandler():void {
			instanceHandler.setMediatorMap(mediatorMap);
		}

	}
}
