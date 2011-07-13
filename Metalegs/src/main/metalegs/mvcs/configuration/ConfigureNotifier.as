package metalegs.mvcs.configuration {
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	import metalegs.base.configuration.Configuration;

	public class ConfigureNotifier extends Configuration {
		override public function startup():void {

			lifetime.mapValue(IEventDispatcher, new EventDispatcher());
		}
	}
}
