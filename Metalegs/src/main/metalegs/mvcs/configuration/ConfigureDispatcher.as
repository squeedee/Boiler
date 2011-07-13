package metalegs.mvcs.configuration {
	import metalegs.base.configuration.Configuration;
	import metalegs.mvcs.dispatcher.Dispatcher;
	import metalegs.mvcs.dispatcher.EventBasedDispatcher;

	public class ConfigureDispatcher extends Configuration {

		override public function configure():void {
			lifetime.mapSingletonOf(Dispatcher, EventBasedDispatcher);
		}
	}
}
