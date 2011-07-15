package metalegs.mvcs.dispatcher {
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;

	public class EventBasedNotifierConnector {

		[Inject]
		public var notifier:IEventDispatcher;

		private var listeners:Dictionary = new Dictionary();
		private var _handler:Function;

		public function setHandler(handler:Function):EventBasedNotifierConnector {
			_handler = handler;
			return this;

		}

		public function connect(eventType:String):void {
			if (listeners[eventType])
				return;

			notifier.addEventListener(eventType, _handler);
			listeners[eventType] = true;
		}

		public function disconnectAll():void {

			for (var eventType:String in listeners) {
				notifier.removeEventListener(eventType, _handler);
			}
			listeners = null;
		}
	}
}
