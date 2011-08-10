package boiler.commandExtension {
	public class DefaultCommandDetector implements CommandDetector {
		public function isCommand(type:Class):Boolean {
			return true;
		}
	}
}
