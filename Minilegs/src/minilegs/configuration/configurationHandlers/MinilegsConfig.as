package minilegs.configuration.configurationHandlers {
	import minilegs.base.ConfigurationBase;
	import minilegs.configuration.instanceHandlers.ControllerInstanceHandler;

	public class MinilegsConfig extends ConfigurationBase {

		override public function configure():void {

			lifetime.addInstanceHandler(ControllerInstanceHandler);
			

		}
	}
}
