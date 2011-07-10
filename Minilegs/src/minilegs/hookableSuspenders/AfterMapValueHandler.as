package minilegs.hookableSuspenders {
	import org.swiftsuspenders.InjectionConfig;

	public interface AfterMapValueHandler {
		function afterMapValue(newConfig:InjectionConfig):void;
	}
}
