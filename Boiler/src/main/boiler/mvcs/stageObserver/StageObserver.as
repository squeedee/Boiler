package boiler.mvcs.stageObserver {
	import flash.display.DisplayObject;

	public interface StageObserver {
		function setDisplayRoot(root:DisplayObject):StageObserver;

		function setHandler(handlerType:StageObserverHandler):StageObserver;
	}
}
