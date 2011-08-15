package boiler.base {
	import hookableSuspenders.HookableInjector;

	/**
	 * Lifetime is a SwistSuspenders/HookableSuspenders Injector with setup/teardown configuration support
	 * built in.
	 *
	 * It embodies the concept of the boiler::base framework, which is that a simple extensible
	 * architecture can be built out of a DIContainer that supports pre-post hooks and a simple configuration
	 * scheme.
	 *
	 * By design, you cannot add methods to Lifetime
	 *
	 * To extend the framework, use Configurations and let the end user (app developer) choose to include them.
	 *
	 * In avoiding methods, you leave other frameworks and consumers the opportunity to add extensions of their own
	 * without running into multiple-inheritence issues. For more details, see the Boiler documentation and website.
	 */
	public final class Lifetime extends HookableInjector {
		private var configurations:Configurations;
		private var _initialConfiguration:*;

		public function Lifetime(xmlConfig:XML = null) {
			super(xmlConfig);
			mapValue(Lifetime, this);
			configurations = new Configurations(this);

		}

		/**
		 * This method is for the application developer to call when they want to clean up their app/module.
		 *
		 * You should use this, it can give all active members of the system a chance to release handlers and garbage
		 * collect.
		 *
		 * Do not use it for 'shutdown' procedures such as closing connections/streams etc. You should set up a framework
		 * level solution such as a shutdown command, which when finished (possibly asynchronously) invokes this method.
		 *
		 * This method can only ever be called once per instance of lifetime.
		 *
		 * Framework developers should not call this method
		 */
		public function die():void {
			configurations.teardown();
		}

		public function runConfiguration(configuration:*):Lifetime {
			configurations.run(configuration);
			return this;
		}

		/**
		 * Just to make Flex dev's life a little easier.
		 * @param value
		 */
		public function set initialConfiguration(value:*):void {
			if (value == null)
				return;

			if (_initialConfiguration == value)
				return;

			_initialConfiguration = value;

			configurations.run(_initialConfiguration);
		}

		public function get initialConfiguration():* {
			return _initialConfiguration;
		}
	}
}
