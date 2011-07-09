package minilegs.hookableSuspenders {
	public interface InstanceHandler {
		function afterInstanced(instance:*):void;

		function beforeInstance(clazz:Class):void;
	}
}
