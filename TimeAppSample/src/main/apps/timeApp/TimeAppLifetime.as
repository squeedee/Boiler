package apps.timeApp {
	import apps.timeApp.configuration.TimeAppConfig;

	import metalegs.mvcs.MVCSLifetime;

	public class TimeAppLifetime extends MVCSLifetime {
		public function TimeAppLifetime() {
			addConfigurationHandler(TimeAppConfig);
			live();
		}

	}
}
