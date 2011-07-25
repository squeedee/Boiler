package boiler.mvcs.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.mvcs.dispatcher.Dispatcher;
	import boiler.mvcs.dispatcher.EventBasedDispatcher;
	import boiler.mvcs.dispatcher.EventBasedNotifierConnector;

	public class ConfigureDispatcher extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(Dispatcher, EventBasedDispatcher);
			lifetime.mapClass(EventBasedNotifierConnector,EventBasedNotifierConnector);
		}

		override public function teardown():void {
			Dispatcher(lifetime.getInstance(Dispatcher)).destruct();
			lifetime.unmap(EventBasedNotifierConnector);
			lifetime.unmap(Dispatcher);
		}
	}
}
