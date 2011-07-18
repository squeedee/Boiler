package apps.timeApp.view {
	import apps.timeApp.controller.ResetCurrentTimeEvent;

	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;

	public class ResetMediator {
		[Inject]
		public var view:Reset;

		[Inject]
		public var dispatcher:IEventDispatcher;

		[PostConstruct]
		public function setup():void {
			view.addEventListener(MouseEvent.CLICK, handleClick);
		}

		private function handleClick(event:MouseEvent):void {
			dispatcher.dispatchEvent(new ResetCurrentTimeEvent());
		}

	}
}
