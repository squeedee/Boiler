package boiler.steam.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.steam.stageObserver.StageObserver;
	import boiler.steam.stageObserver.StageObserverImpl;

	public class StageObserverConfiguration extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingletonOf(StageObserver, StageObserverImpl)
		}

		override public function teardown():void {
			lifetime.unmap(StageObserver);
		}

	}
}
