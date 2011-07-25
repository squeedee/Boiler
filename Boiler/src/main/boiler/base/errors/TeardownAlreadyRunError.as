package boiler.base.errors {
	public class TeardownAlreadyRunError extends Error {

		public function TeardownAlreadyRunError() {
			super("If you can only live once, logically, you can only die once")
		}
	}
}
