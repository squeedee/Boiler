package minilegs.hookableSuspenders {
	import org.swiftsuspenders.InjectionConfig;

	public interface BeforeMapClassHandler {
		function beforeMapValue(existingConfig:InjectionConfig, instanciateClass:Class):void;
	}
}
