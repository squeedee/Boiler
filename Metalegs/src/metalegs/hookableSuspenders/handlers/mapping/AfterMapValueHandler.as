package metalegs.hookableSuspenders.handlers.mapping {
	import org.swiftsuspenders.InjectionConfig;

	public interface AfterMapValueHandler {
		function afterMapValue(newConfig:InjectionConfig):void;
	}
}
