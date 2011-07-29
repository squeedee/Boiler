package main.view {
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;

	import main.controller.ToggleStartStopEvent;
	import main.model.StopwatchStateUpdatedEvent;
	import main.model.StopwatchTimeModel;

	public class StartStopButtonMediator {

		[Inject]
		public var state:StopwatchTimeModel;

		[Inject]
		public var notifier:IEventDispatcher;

		private var view:StartStopButton;

		public function register(view:StartStopButton):void {
			this.view = view;
			addListeners();
			updateFromModel();
		}

		public function deregister():void {
			removeListeners();
		}

		private function addListeners():void {
			view.addEventListener(MouseEvent.CLICK, handleClick);
			notifier.addEventListener(StopwatchStateUpdatedEvent.UPDATED, updateFromModel);
		}

		private function removeListeners():void {
			view.removeEventListener(MouseEvent.CLICK, handleClick);
			notifier.removeEventListener(StopwatchStateUpdatedEvent.UPDATED, updateFromModel)
		}

		private function updateFromModel(event:StopwatchStateUpdatedEvent = null):void {
			view.label = state.isRunning() ? "Stop" : "Start" ;
		}

		private function handleClick(event:MouseEvent):void {
			notifier.dispatchEvent(new ToggleStartStopEvent())
		}

	}
}
