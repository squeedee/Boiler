package minilegs.configuration {
	import minilegs.base.configuration.ConfigurationBase;
	import minilegs.base.reflection.Reflector;
	import minilegs.controller.ControllerExtension;

	public class MinilegsConfig extends ConfigurationBase {

		override public function configure():void {
			lifetime.mapSingleton(Reflector);
			lifetime.instanceHandlers.add(ControllerExtension);
		}
	}
}
