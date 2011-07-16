package metalegs.mvcs.displayInstanceFollower {
	import flash.display.DisplayObject;

	public interface DisplayInstanceFollower {


		// @todo we could use more fluency: stagePresence().follow(myView).with(MyMediator)
		function followDisplayObject(follow:DisplayObject, managesLifetimeOf:Function):void;

	}
}
