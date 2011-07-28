package main.model {
	import flash.events.IEventDispatcher;

	public class StopwatchState {
		private var running:Boolean;

		[Inject]
		public var notifier:IEventDispatcher;

		public function StopwatchState() {
			running = false;
		}

		public function stop():void {
			if (isStopped())
				return;

			running = false;

			notifyChange();
		}

		public function run():void {
			if (isRunning())
				return;

			running = true;

			notifyChange();
		}

		public function toggle():void {
			running = !running;

			notifyChange();
		}

		public function isRunning():Boolean {
			return running;
		}

		public function isStopped():Boolean {
			return !running;
		}

		private function notifyChange():void {
			notifier.dispatchEvent(new StopwatchStateUpdatedEvent());
		}
	}
}
