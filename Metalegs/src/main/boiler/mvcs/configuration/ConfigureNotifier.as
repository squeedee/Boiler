package boiler.mvcs.configuration {
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	import boiler.base.configuration.ConfigurationBase;

	public class ConfigureNotifier extends ConfigurationBase {
		override public function startup():void {

			lifetime.mapValue(IEventDispatcher, new EventDispatcher());
		}

		override public function teardown():void {
			lifetime.unmap(IEventDispatcher);
		}
	}
}
