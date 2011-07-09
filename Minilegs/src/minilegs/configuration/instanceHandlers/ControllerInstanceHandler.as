package minilegs.configuration.instanceHandlers {
	import minilegs.base.reflection.Reflector;
	import minilegs.hookableSuspenders.AfterInstance;

	public class ControllerInstanceHandler implements AfterInstance {
		[Inject]
		public var reflector:Reflector;

		public function afterInstanced(instance:*):void {
			trace("Instanced: " + reflector.getReflection(instance).fqn())
		}
	}
}
