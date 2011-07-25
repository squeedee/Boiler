package boiler.base.errors {
	public class TeardownCanOnlyRunAfterStartupError extends Error {

		public function TeardownCanOnlyRunAfterStartupError() {
			super("Only the good die young");
		}
	}
}
