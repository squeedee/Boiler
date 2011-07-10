package minilegs.hookableSuspenders {
	import org.swiftsuspenders.InjectionConfig;

	public interface BeforeMapValueHandler {
		function beforeMapValue(existingConfig:InjectionConfig, useValue:Object):void;
	}
}
