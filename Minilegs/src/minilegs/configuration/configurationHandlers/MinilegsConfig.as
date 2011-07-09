package minilegs.configuration.configurationHandlers {
	import minilegs.base.configuration.ConfigurationBase;
	import minilegs.base.reflection.Reflector;
	import minilegs.configuration.instanceHandlers.ControllerInstanceHandler;

	public class MinilegsConfig extends ConfigurationBase {
		override public function configure():void {
			lifetime.mapSingleton(Reflector);
			lifetime.instanceHandlers.add(ControllerInstanceHandler);
		}
	}
}
