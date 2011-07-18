package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.mvcs.mediator.DefaultMediatorDetector;
	import metalegs.mvcs.mediator.DefaultMediatorInstanceMapper;
	import metalegs.mvcs.mediator.MediatorDetector;
	import metalegs.mvcs.mediator.MediatorExtension;
	import metalegs.mvcs.mediator.MediatorInstanceMapper;

	public class ConfigureMediator extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(MediatorDetector,DefaultMediatorDetector);
			lifetime.mapSingletonOf(MediatorInstanceMapper,DefaultMediatorInstanceMapper);
			lifetime.mappingHandlers.add(MediatorExtension);

		}

		override public function teardown():void {

			lifetime.mappingHandlers.remove(MediatorExtension);
			lifetime.unmap(MediatorInstanceMapper);
			lifetime.unmap(MediatorDetector);
		}
	}
}
