package apps.timeApp.configuration {
	import apps.timeApp.controller.CurrentTimeController;
	import apps.timeApp.model.CurrentTime;

	import minilegs.base.configuration.ConfigurationBase;

	public class TimeAppConfig extends ConfigurationBase {

		override public function configure():void {

			// model
			lifetime.mapSingleton(CurrentTime);

			// controllers
			//lifetime.mapController(CurrentTimeController);
		}
	}
}
	