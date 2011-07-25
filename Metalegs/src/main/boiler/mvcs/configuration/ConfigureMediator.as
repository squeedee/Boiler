package boiler.mvcs.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.mvcs.mediator.DefaultMediatorDetector;
	import boiler.mvcs.mediator.MediatorDetector;
	import boiler.mvcs.mediator.MediatorExtension;

	public class ConfigureMediator extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(MediatorDetector, DefaultMediatorDetector);
			lifetime.mappingHandlers.add(MediatorExtension);

		}

		override public function teardown():void {

			lifetime.mappingHandlers.remove(MediatorExtension);
			lifetime.unmap(MediatorDetector);
		}
	}
}
