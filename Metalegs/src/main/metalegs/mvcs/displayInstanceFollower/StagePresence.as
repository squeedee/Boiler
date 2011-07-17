package metalegs.mvcs.displayInstanceFollower {
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.Dictionary;

	import metalegs.base.Lifetime;

	public class StagePresence {
		private var following:Dictionary = new Dictionary();

		[Inject]
		public var lifetime:Lifetime;

		private var eventContext:DisplayObject;

		[PostConstruct]
		public function setup():void {

			injectDisplayContext();

			addListeners();
		}

		private function injectDisplayContext():void {
			if (lifetime.hasMapping(DisplayObject))
				eventContext = lifetime.getInstance(DisplayObject);
		}

		public function follow(viewType:Class):FollowConfiguration {
			return following[viewType] ||= new FollowConfiguration();
		}

		public function destruct():void {
			removeListeners();

			for each (var followConfiguration:FollowConfiguration in following) {
				// @todo I feel like this collection should be its own class too
				followConfiguration.destruct();
			}

			following = null;
		}

		private function addListeners():void {
			if (contextWasInjected())
				return;

			eventContext.addEventListener(Event.ADDED_TO_STAGE, handleAdd);
			eventContext.addEventListener(Event.REMOVED_FROM_STAGE, handleRemove)
		}

		private function removeListeners():void {
			if (contextWasInjected())
				return;

			eventContext.removeEventListener(Event.ADDED_TO_STAGE, handleAdd);
			eventContext.removeEventListener(Event.REMOVED_FROM_STAGE, handleRemove)
		}

		private function contextWasInjected():Boolean {
			return eventContext == null;
		}

		private function handleRemove(event:Event):void {
			trace("Removed: " + event.target.toString());

		}

		private function handleAdd(event:Event):void {
			trace("Added: " + event.target.toString());
		}
	}
}

import flash.utils.Dictionary;

class FollowConfiguration {

	private var typesToInstance:Dictionary = new Dictionary();

	public function withType(factoryType:Class):FollowConfiguration {
		typesToInstance[factoryType] = true;

		return this;

	}

	public function destruct():void {
		typesToInstance = null;
	}
}