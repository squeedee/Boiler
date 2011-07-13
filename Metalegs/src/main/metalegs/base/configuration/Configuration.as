package metalegs.base.configuration {
	import metalegs.base.*;

	public class Configuration implements ConfigurationHandler {

		[Inject]
		public var lifetime:Lifetime;

		public function startup():void {
		}

		public function teardown():void {
		}
	}
}
