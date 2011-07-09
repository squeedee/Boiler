package minilegs.configuration.instanceHandlers {
	import minilegs.base.reflection.Reflector;
	import minilegs.hookableSuspenders.InstanceHandler;

	public class ControllerInstanceHandler implements InstanceHandler {
		[Inject]
		public var reflector:Reflector;

		public function afterInstanced(instance:*):void {
			trace("Instanced: " + reflector.getReflection(instance).fqn())
		}
	}
}
