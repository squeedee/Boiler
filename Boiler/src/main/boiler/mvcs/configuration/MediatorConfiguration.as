package boiler.mvcs.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.mvcs.mediator.DefaultMediatorDetector;
	import boiler.mvcs.mediator.MediatorDetector;
	import boiler.mvcs.mediator.MediatorExtension;
	import boiler.mvcs.mediator.map.MediatorMap;
	import boiler.mvcs.mediator.map.MediatorMapImpl;
	import boiler.mvcs.mediator.ViewInstanceHandler;

	public class MediatorConfiguration extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(MediatorDetector, DefaultMediatorDetector);
			lifetime.mapSingleton(ViewInstanceHandler);
			lifetime.mapSingletonOf(MediatorMap,MediatorMapImpl);
			lifetime.mappingHandlers.add(MediatorExtension);

		}

		override public function teardown():void {

			lifetime.mappingHandlers.remove(MediatorExtension);
			lifetime.unmap(MediatorDetector);
		}
	}
}
