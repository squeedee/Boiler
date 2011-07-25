package boiler.mvcs.displayInstanceFollower {
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

	import boiler.base.Lifetime;
	import boiler.reflection.ClassByInstanceCache;

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

		public function follow(viewType:Class):FollowConfiguration {
			return following[viewType] ||= new FollowConfiguration(lifetime);
		}

		public function destruct():void {
			removeListeners();

			for each (var followConfiguration:FollowConfiguration in following) {
				followConfiguration.destruct();
			}

			following = null;
		}

		private function injectDisplayContext():void {
			if (lifetime.hasMapping(DisplayObject))
				eventContext = lifetime.getInstance(DisplayObject);
		}

		private function addListeners():void {
			if (!contextExists())
				return;

			eventContext.addEventListener(Event.ADDED_TO_STAGE, handleAdd, true);
			eventContext.addEventListener(Event.REMOVED_FROM_STAGE, handleRemove, true)
		}

		private function removeListeners():void {
			if (!contextExists())
				return;

			eventContext.removeEventListener(Event.ADDED_TO_STAGE, handleAdd, true);
			eventContext.removeEventListener(Event.REMOVED_FROM_STAGE, handleRemove, true)
		}

		private function contextExists():Boolean {
			return eventContext != null;
		}

		private function handleRemove(event:Event):void {
			var view:DisplayObject = DisplayObject(event.target);
			var viewType:Class = instanceCache.getClassByInstance(view);

			var config:FollowConfiguration = following[viewType];

			if (!config)
				return;

			config.destroyMediators(view);

		}

		// todo: need flex hack for when they move containers.
		// todo: domain language here is really murky, responsibility betweein this and FollowConf is poorly split

		private function handleAdd(event:Event):void {

			var view:DisplayObject = DisplayObject(event.target);
			var viewType:Class = instanceCache.getClassByInstance(view);

			var config:FollowConfiguration = following[viewType];

			if (!config)
				return;


			config.instanceMediators(view);

		}
	}
}

import flash.utils.Dictionary;

import boiler.base.Lifetime;

// todo Refactor this. Its a factory, and the mapper is a trigger. need to sort this out..
class FollowConfiguration {
	private var _lifetime:Lifetime;
	private var mediatorTypesToInstance:Dictionary = new Dictionary();
	private var mediatorInstancesByView:Dictionary = new Dictionary();

	public function FollowConfiguration(lifetime:Lifetime) {
		_lifetime = lifetime;
	}

	public function withType(factoryType:Class):FollowConfiguration {
		mediatorTypesToInstance[factoryType] = factoryType;

		return this;
	}

	private static const REGISTER:String = "register";

	public function instanceMediators(view:*):void {
		if (mediatorInstancesByView[view])
			throw new Error("Shouldn't ever happen. is the destory getting blocked?");

		var mediatorInstances:Array = [];
		mediatorInstancesByView[view] = mediatorInstances;

		for each (var mediatorType:Class in mediatorTypesToInstance) {
			var mediatorInstance:* = _lifetime.getInstance(mediatorType);
			mediatorInstances.push(mediatorInstance);
			mediatorInstance[REGISTER].call(null, view);
		}
	}

	public function destruct():void {
		for (var view:* in mediatorInstancesByView) {
			destroyMediators(view);
		}
		mediatorInstancesByView = null;
		mediatorTypesToInstance = null;
	}

	private static const DEREGISTER:String = "deregister";

	public function destroyMediators(view:*):void {
		var mediatorInstances:Array = mediatorInstancesByView[view];
		for each (var mediatorInstance:* in mediatorInstances) {
			if (mediatorInstance.hasOwnProperty(DEREGISTER))
				mediatorInstance[DEREGISTER]();
		}
		mediatorInstancesByView[view] = null;
	}
}