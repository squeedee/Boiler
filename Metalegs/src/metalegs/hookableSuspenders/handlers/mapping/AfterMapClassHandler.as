package metalegs.hookableSuspenders.handlers.mapping {
	import org.swiftsuspenders.InjectionConfig;

	public interface AfterMapClassHandler {
		function afterMapClass(newConfig:InjectionConfig):void;
	}
}
