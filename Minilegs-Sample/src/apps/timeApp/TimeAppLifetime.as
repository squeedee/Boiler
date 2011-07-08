package apps.timeApp {
	import apps.timeApp.configuration.TimeAppConfig;

	import minilegs.MinilegsLifetime;

	public class TimeAppLifetime extends MinilegsLifetime {
		public function TimeAppLifetime() {
			addConfigurationHandler(TimeAppConfig);
			live();
		}
	}
}
