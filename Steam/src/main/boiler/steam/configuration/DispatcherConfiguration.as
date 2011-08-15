package boiler.steam.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.steam.dispatcher.Dispatcher;
	import boiler.steam.dispatcher.DispatcherImpl;
	import boiler.steam.dispatcher.NotificationObserver;

	public class DispatcherConfiguration extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(Dispatcher, DispatcherImpl);
			lifetime.mapClass(NotificationObserver, NotificationObserver);
		}

		override public function teardown():void {
			Dispatcher(lifetime.getInstance(Dispatcher)).destruct();
			lifetime.unmap(NotificationObserver);
			lifetime.unmap(Dispatcher);
		}
	}
}
