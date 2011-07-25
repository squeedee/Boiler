package boiler.base.configuration {

	/**
	 * A configuration handler is a chunk of startup and teardown code which is responsible for configuring an extension
	 * to the system. These extensions can be framework extensions, or application extenstions. Boiler does not
	 * discriminate.
	 *
	 * Configurations remain in memory until the lifetime is destroyed.
	 *
	 * Configurations are instanciated with SwiftSuspenders, so you can use [Inject] and [PostConstruct] in these
	 * classes.
	 */
	public interface Configuration {

		/**
		 * Configure your extension here by mapping injections, preparing any singletons and hooking into the
		 * HopokableSuspenders before and after hooks.
		 * You can also add further configurations to the lifetime here, giving framework developers the opportunity to
		 * add hooks after the application developer's hooks have been added.
		 */
		function startup():void;

		/**
		 * Do your cleanup here. This method is called on the same Configuration instance as it's startup, which
		 * lets you keep state from start to finish if it's needed.
		 */
		function teardown():void;
	}
}
