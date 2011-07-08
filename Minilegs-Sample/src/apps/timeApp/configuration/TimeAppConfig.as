package apps.timeApp.configuration {
	import apps.timeApp.model.CurrentTime;

	import minilegs.base.ConfigurationBase;

	public class TimeAppConfig extends ConfigurationBase {

		override public function configure():void {
			lifetime.mapSingleton(CurrentTime);
		}
	}
}
