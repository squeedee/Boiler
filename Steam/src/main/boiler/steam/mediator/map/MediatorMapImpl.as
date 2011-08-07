package boiler.steam.mediator.map {
	import boiler.reflection.ClassByInstanceCache;

	import flash.display.DisplayObject;
	import flash.utils.Dictionary;

	public class MediatorMapImpl implements MediatorMap {

		[Inject]
		public var instanceCache:ClassByInstanceCache;
		private var factories:Dictionary = new Dictionary();

		public function mapFactory(config:MediatorFactory):MediatorMap {
			getMediatorFactoriesByClass(config.viewType).push(config);
			return this;
		}

		public function getMediatorFactoriesByClass(viewType:Class):Array {
			return factories[viewType] ||= [];
		}

		public function getMediatorFactories(viewInstance:DisplayObject):Array {
			const viewType:Class = instanceCache.getClassByInstance(viewInstance);
			return getMediatorFactoriesByClass(viewType);
		}
	}
}
