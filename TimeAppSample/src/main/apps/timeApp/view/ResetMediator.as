package apps.timeApp.view {
	import apps.timeApp.controller.ResetCurrentTimeEvent;

	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;

	public class ResetMediator {

		[Inject]
		public var dispatcher:IEventDispatcher;

		public function register(view:Reset):void {
			view.addEventListener(MouseEvent.CLICK, handleClick);
		}

		private function handleClick(event:MouseEvent):void {
			dispatcher.dispatchEvent(new ResetCurrentTimeEvent());
		}

	}
}
