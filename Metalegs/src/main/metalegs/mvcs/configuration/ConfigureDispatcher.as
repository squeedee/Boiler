package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.mvcs.dispatcher.Dispatcher;
	import metalegs.mvcs.dispatcher.EventBasedDispatcher;

	public class ConfigureDispatcher extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(Dispatcher, EventBasedDispatcher);
		}

		override public function teardown():void {
			Dispatcher(lifetime.getInstance(Dispatcher)).destruct();
			lifetime.unmap(Dispatcher);
		}
	}
}
