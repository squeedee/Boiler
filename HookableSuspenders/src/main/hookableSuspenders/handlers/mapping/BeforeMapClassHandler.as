package hookableSuspenders.handlers.mapping {
	import org.swiftsuspenders.InjectionConfig;

	public interface BeforeMapClassHandler {
		function beforeMapClass(existingConfig:InjectionConfig, instanciateClass:Class):void;
	}
}
