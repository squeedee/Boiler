package boiler.mvcs.mediator {
	import boiler.mvcs.mediator.map.MediatorFactory;
	import boiler.mvcs.mediator.map.MediatorMap;
	import boiler.mvcs.stageObserver.StageObserverHandler;

	import flash.display.DisplayObject;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

	public class ViewInstanceHandler implements StageObserverHandler {

		private var _mediatorMap:MediatorMap;

		private var removes:Dictionary = new Dictionary();

		public function setMediatorMap(mediatorMap:MediatorMap):void {
			_mediatorMap = mediatorMap;
		}

		public function onAddedToStage(view:DisplayObject):void {
			const factories:Array = getFactories(view);
			const removeMethods:Array = removes[view] = [];

			var mediator:*;

			for each (var mediatorFactory:MediatorFactory in factories) {
				mediator = mediatorFactory.registerMediator(view);
				removeMethods.push(function():void {
					mediatorFactory.deregisterMediator(mediator)
				});
			}
		}

		private function getFactories(view:DisplayObject):Array {
			return _mediatorMap.getMediatorFactories(view);
		}

		public function onRemovedFromStage(view:DisplayObject):void {
			var removeMethods:Array = removes[view];

			for each (var closure:Function in removeMethods) {
				closure();
			}
		}

	}
}
