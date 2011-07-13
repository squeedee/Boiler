package apps.timeApp.model {
	import flash.events.IEventDispatcher;

	public class CurrentTime {

		private var _hour:int;
		private var _minutes:int;
		private var _am:Boolean;

		[Inject]
		public var notifier:IEventDispatcher;


		public function setTimeToNow():void {
			var date:Date = new Date();

			var hour24:int = date.getHours();
			_hour = hour24 % 12;
			_am = (hour24 == _hour);

			_minutes = date.getMinutes();

			notifier.dispatchEvent(new CurrentTimeChangedEvent());
		}

		public function get hour():int {
			return _hour;
		}

		public function get minutes():int {
			return _minutes;
		}

		public function get am():Boolean {
			return _am;
		}
	}
}
