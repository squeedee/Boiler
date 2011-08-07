package boiler.steam.stageObserver {
	import flash.display.DisplayObject;
	import flash.events.Event;

	public class StageObserverImpl implements StageObserver {

		private var root:DisplayObject;
		private var handler:StageObserverHandler;

		public function setDisplayRoot(root:DisplayObject):StageObserver {
			if (!isSameRoot(root))
				removeListeners();

			this.root = root;

			if (hasRoot())
				return this;

			addListeners();

			return this;
		}

		public function setHandler(handlerType:StageObserverHandler):StageObserver {
			handler = handlerType;
			return this;
		}

		private function isSameRoot(root:DisplayObject):Boolean {
			return this.root == root;
		}

		private function hasRoot():Boolean {
			return this.root == null;
		}

		private function removeListeners():void {
			if (root == null)
				return;

			root.removeEventListener(Event.ADDED_TO_STAGE, handleAdd, true);
			root.removeEventListener(Event.REMOVED_FROM_STAGE, handleRemove, true);
		}

		private function addListeners():void {
			if (root == null)
				return;

			root.addEventListener(Event.ADDED_TO_STAGE, handleAdd, true);
			root.addEventListener(Event.REMOVED_FROM_STAGE, handleRemove, true);
		}

		private function handleAdd(event:Event):void {
			// todo, flex debounce
			handler.onAddedToStage(DisplayObject(event.target));
		}

		private function handleRemove(event:Event):void {
			handler.onRemovedFromStage(DisplayObject(event.target));
		}
	}
}
