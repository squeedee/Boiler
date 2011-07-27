package boiler.mvcs.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.mvcs.stageObserver.StageObserver;
	import boiler.mvcs.stageObserver.StageObserverImpl;

	public class StageObserverConfiguration extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(StageObserver, StageObserverImpl)
		}

		override public function teardown():void {
			lifetime.unmap(StageObserver);
		}

	}
}
