package apps.timeApp.configuration {
	import apps.timeApp.controller.CurrentTimeController;
	import apps.timeApp.model.CurrentTime;
	import apps.timeApp.view.ResetMediator;

	import metalegs.base.configuration.ConfigurationBase;

	public class TimeAppConfig extends ConfigurationBase {

		override public function startup():void {

			// model
			lifetime.mapSingleton(CurrentTime);

			// controllers
			lifetime.mapSingleton(CurrentTimeController);

			// mediators
			lifetime.mapClass(ResetMediator,ResetMediator);
		}
	}
}
	