package boiler.steam.stageObserver {
	import flash.display.DisplayObject;

	public interface StageObserverHandler {
		function onAddedToStage(displayObject:DisplayObject):void;

		function onRemovedFromStage(displayObject:DisplayObject):void;
	}
}
