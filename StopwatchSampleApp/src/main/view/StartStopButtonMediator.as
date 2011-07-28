package main.view {
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;

	import main.controller.ToggleStopwatchStateEvent;
	import main.model.StopwatchState;
	import main.model.StopwatchStateUpdatedEvent;

	public class StartStopButtonMediator {

		[Inject]
		public var notifier:IEventDispatcher;

		[Inject]
		public var state:StopwatchState;

		private var view:StartStopButton;

		public function register(view:StartStopButton):void {
			this.view = view;

			view.addEventListener(MouseEvent.CLICK, handleClick);

			notifier.addEventListener(StopwatchStateUpdatedEvent.UPDATED, updateFromModel);

			updateFromModel();

		}

		public function deregister():void {
			view.removeEventListener(MouseEvent.CLICK, handleClick);
			notifier.removeEventListener(StopwatchStateUpdatedEvent.UPDATED, updateFromModel)
		}

		private function updateFromModel(event:StopwatchStateUpdatedEvent = null):void {
			view.label = state.isStopped() ? "Start" : "Stop";
		}

		private function handleClick(event:MouseEvent):void {
			notifier.dispatchEvent(new ToggleStopwatchStateEvent())
		}
	}
}
