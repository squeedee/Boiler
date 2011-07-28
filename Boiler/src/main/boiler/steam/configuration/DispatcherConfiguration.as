package boiler.steam.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.steam.dispatcher.Dispatcher;
	import boiler.steam.dispatcher.EventBasedDispatcher;
	import boiler.steam.dispatcher.EventBasedNotifierConnector;

	public class DispatcherConfiguration extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(Dispatcher, EventBasedDispatcher);
			lifetime.mapClass(EventBasedNotifierConnector, EventBasedNotifierConnector);
		}

		override public function teardown():void {
			Dispatcher(lifetime.getInstance(Dispatcher)).destruct();
			lifetime.unmap(EventBasedNotifierConnector);
			lifetime.unmap(Dispatcher);
		}
	}
}
