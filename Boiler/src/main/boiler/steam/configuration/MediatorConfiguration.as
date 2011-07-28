package boiler.steam.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.steam.mediator.DefaultMediatorDetector;
	import boiler.steam.mediator.MediatorDetector;
	import boiler.steam.mediator.MediatorExtension;
	import boiler.steam.mediator.map.MediatorMap;
	import boiler.steam.mediator.map.MediatorMapImpl;
	import boiler.steam.mediator.ViewInstanceHandler;

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
