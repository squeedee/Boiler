package boiler.steam.dispatcher {
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;

	public class NotificationObserver {

		[Inject]
		public var notifier:IEventDispatcher;

		private var listeners:Dictionary = new Dictionary();
		private var _handler:Function;

		public function setHandler(handler:Function):NotificationObserver {
			_handler = handler;
			return this;
		}

		public function connect(event:String):void {
			if (listeners[event])
				return;

			notifier.addEventListener(event, _handler);
			listeners[event] = true;
		}

		public function disconnectAll():void {

			for (var event:String in listeners) {
				notifier.removeEventListener(event, _handler);
			}
			listeners = null;
		}
	}
}
