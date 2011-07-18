package metalegs.mvcs.displayInstanceFollower {
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.Dictionary;

	import metalegs.base.Lifetime;
	import metalegs.reflection.ClassByInstanceCache;

	public class StagePresence {
		private var following:Dictionary = new Dictionary();
		private var eventContext:DisplayObject;

		[Inject]
		public var lifetime:Lifetime;

		[Inject]
		public var instanceCache:ClassByInstanceCache;

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
			return following[viewType] ||= new FollowConfiguration(lifetime);
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

			eventContext.addEventListener(Event.ADDED_TO_STAGE, handleAdd, true);
			eventContext.addEventListener(Event.REMOVED_FROM_STAGE, handleRemove, true)
		}

		private function removeListeners():void {
			if (contextWasInjected())
				return;

			eventContext.removeEventListener(Event.ADDED_TO_STAGE, handleAdd, true);
			eventContext.removeEventListener(Event.REMOVED_FROM_STAGE, handleRemove, true)
		}

		private function contextWasInjected():Boolean {
			return eventContext == null;
		}

		private function handleRemove(event:Event):void {
			trace("Removed: " + event.target.toString());

		}

		// todo: need flex hack for when they move containers.
		// todo: domain language here is really murky, responsibility betweein this and FollowConf is poorly split
		private function handleAdd(event:Event):void {

			var view:DisplayObject = DisplayObject(event.target);
			var viewType:Class = instanceCache.getClassByInstance(view);

			var config:FollowConfiguration = following[viewType];

			if (!config)
				return;

			// todo: I wonder if this gymnastics could be avoided with mediators that have obvious methods for
			// todo: mediation, like register(view:MyView) ?
			lifetime.mapValue(viewType,view);
			
			config.instanceMediators(view);

			lifetime.unmap(viewType);

		}
	}
}

import flash.utils.Dictionary;

import metalegs.base.Lifetime;

class FollowConfiguration {
	private var _lifetime:Lifetime;
	private var typesToInstance:Dictionary = new Dictionary();
	private var instances:Dictionary = new Dictionary();

	public function FollowConfiguration(lifetime:Lifetime) {
		_lifetime = lifetime;
	}

	public function withType(factoryType:Class):FollowConfiguration {
		typesToInstance[factoryType] = factoryType;

		return this;
	}

	public function instanceMediators(view:*):void {
		for each (var type:Class in typesToInstance) {
			instances[view] = _lifetime.getInstance(type);
		}
	}

	public function destruct():void {
		// gee i'd like to call destroy on those instances
		instances = null;
		typesToInstance = null;
	}

}