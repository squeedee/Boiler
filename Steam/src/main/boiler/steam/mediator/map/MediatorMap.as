package boiler.steam.mediator.map {
	import flash.display.DisplayObject;

	public interface MediatorMap {
		function mapFactory(config:MediatorFactory):MediatorMap;

		function getMediatorFactoriesByClass(viewType:Class):Array;

		function getMediatorFactories(viewInstance:DisplayObject):Array;
	}
}
