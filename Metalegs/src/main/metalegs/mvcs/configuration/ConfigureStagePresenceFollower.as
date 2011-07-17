package metalegs.mvcs.configuration {
	import metalegs.base.configuration.ConfigurationBase;
	import metalegs.mvcs.displayInstanceFollower.StagePresence;

	public class ConfigureStagePresenceFollower extends ConfigurationBase {

		override public function startup():void {
			lifetime.mapSingleton(StagePresence)
		}

		override public function teardown():void {
			lifetime.unmap(StagePresence);
		}

	}
}
