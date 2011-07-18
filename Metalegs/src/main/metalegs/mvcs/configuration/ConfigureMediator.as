package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.mvcs.mediator.DefaultMediatorDetector;
	import metalegs.mvcs.mediator.MediatorDetector;
	import metalegs.mvcs.mediator.MediatorExtension;

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
