package minilegs.configuration.instanceHandlers {
	import minilegs.base.reflection.Reflector;
	import minilegs.hookableSuspenders.AfterInstanceHandler;

	public class ControllerInstanceHandler implements AfterInstanceHandler {
		[Inject]
		public var reflector:Reflector;

		public function afterInstanced(instance:*):void {
			trace("Instanced: " + reflector.getReflection(instance).fqn())
		}
	}
}
