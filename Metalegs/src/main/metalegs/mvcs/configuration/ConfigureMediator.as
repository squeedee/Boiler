package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.mvcs.mediator.MediatorExtension;

	public class ConfigureMediator extends ConfigurationBase {

		override public function startup():void {
			lifetime.mappingHandlers.add(MediatorExtension);

		}

		override public function teardown():void {
			lifetime.mappingHandlers.remove(MediatorExtension);
		}
	}
}
