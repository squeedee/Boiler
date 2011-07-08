package minilegs.configuration.configurationHandlers {
	import minilegs.base.Lifetime;
	import minilegs.configuration.instanceHandlers.ControllerInstanceHandler;

	public class MinilegsConfig {
		public static function configure(lifetime:Lifetime):void {
			lifetime.addInstanceHandler(ControllerInstanceHandler);
		}
	}
}
