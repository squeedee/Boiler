package main.model {
	import flash.events.IEventDispatcher;
	import flash.utils.getTimer;

	public class StopwatchTimeModel {

		private var startTime:int = -1;
		private var pauseTime:int = -1;

		[Inject]
		public var notifier:IEventDispatcher;

		public function getElapsedTime():int {
			if (isPaused())
				return pauseTime;

			if (! isRunning())
				return 0;

			return getCurrentRunTime();
		}

		public function restart():void {
			if (isPaused()) {
				unPause();
			} else {
				startTime = getElapsedTime();
			}

			notifier.dispatchEvent(new StopwatchStateUpdatedEvent());
		}

		public function reset():void {
			startTime = -1;
			pauseTime = -1;
			notifier.dispatchEvent(new StopwatchStateUpdatedEvent());
		}

		public function stop():void {
			pauseTime = getCurrentRunTime();
			startTime = -1;
			notifier.dispatchEvent(new StopwatchStateUpdatedEvent());
		}

		public function isPaused():Boolean {
			return pauseTime >= 0 ;
		}

		public function isRunning():Boolean {
			return startTime >= 0;
		}

		public function toggleStopStart():void {
			if (isPaused()) {
				restart();
				return;
			}

			stop();
		}

		private function unPause():void {
			startTime = getTimer() - pauseTime;
			pauseTime = -1;
		}

		private function getCurrentRunTime():int {
			return getTimer() - startTime;
		}

	}
}
