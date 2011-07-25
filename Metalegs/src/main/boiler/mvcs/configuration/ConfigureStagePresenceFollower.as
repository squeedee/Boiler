package boiler.mvcs.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.mvcs.displayInstanceFollower.StagePresence;

	public class ConfigureStagePresenceFollower extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingleton(StagePresence)
		}

		override public function teardown():void {
			lifetime.unmap(StagePresence);
		}

	}
}
