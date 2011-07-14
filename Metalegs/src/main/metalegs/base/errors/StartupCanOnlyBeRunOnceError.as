package metalegs.base.errors {
	public class StartupCanOnlyBeRunOnceError extends Error {

		public function StartupCanOnlyBeRunOnceError() {
			super("You can only live once");
		}
	}
}
