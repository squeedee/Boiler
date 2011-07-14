package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.mvcs.dispatcher.Dispatcher;
	import metalegs.mvcs.dispatcher.EventBasedDispatcher;

	public class ConfigureDispatcher extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(Dispatcher, EventBasedDispatcher);
		}
	}
}
