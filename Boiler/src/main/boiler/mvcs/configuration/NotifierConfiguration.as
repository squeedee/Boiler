package boiler.mvcs.configuration {
	import boiler.base.configuration.ConfigurationBase;

	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class NotifierConfiguration extends ConfigurationBase {
		override public function startup():void {

			lifetime.mapValue(IEventDispatcher, new EventDispatcher());
		}

		override public function teardown():void {
			lifetime.unmap(IEventDispatcher);
		}
	}
}
