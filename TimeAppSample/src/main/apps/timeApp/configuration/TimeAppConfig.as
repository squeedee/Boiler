package apps.timeApp.configuration {
	import apps.timeApp.controller.CurrentTimeController;
	import apps.timeApp.model.CurrentTime;

	import metalegs.base.configuration.Configuration;

	public class TimeAppConfig extends Configuration {

		override public function startup():void {

			// model
			lifetime.mapSingleton(CurrentTime);

			// controllers
			lifetime.mapSingleton(CurrentTimeController);
		}
	}
}
	