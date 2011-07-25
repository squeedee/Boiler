package boiler.base.errors {
	public class ConfigurationCannotBeAddedError extends Error {
		public function ConfigurationCannotBeAddedError() {
			super("You're too late");
		}
	}
}
