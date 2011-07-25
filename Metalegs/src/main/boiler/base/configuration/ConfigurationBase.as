package boiler.base.configuration {
	import boiler.base.*;

	/**
	 * @inherit
	 *
	 * ConfigurationBase adds a local #liftime instance to make life a little simpler.
	 */
	public class ConfigurationBase implements Configuration {

		[Inject]
		public var lifetime:Lifetime;

		/**
		 * @inherit
		 */
		public function startup():void {
		}

		/**
		 * @inherit
		 */
		public function teardown():void {
		}
	}
}
