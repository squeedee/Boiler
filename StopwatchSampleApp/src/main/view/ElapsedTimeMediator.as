package main.view {
	import flash.events.IEventDispatcher;

	import main.model.StopwatchStateUpdatedEvent;
	import main.model.StopwatchTimeModel;

	public class ElapsedTimeMediator {

		private var view:ElapsedTime;

		[Inject]
		public var notifier:IEventDispatcher;

		[Inject]
		public var currentTime:StopwatchTimeModel;

		public function register(view:ElapsedTime):void {
			this.view = view;

			notifier.addEventListener(StopwatchStateUpdatedEvent.UPDATED, handleStateChange);

			updateFromModel();
		}

		public function deregister():void {
			notifier.removeEventListener(StopwatchStateUpdatedEvent.UPDATED, handleStateChange);
		}

		private function handleStateChange(event:StopwatchStateUpdatedEvent):void {
			updateFromModel();
		}

		private function updateFromModel():void {
			view.setTime(currentTime.getElapsedTime());
		}
	}
}
