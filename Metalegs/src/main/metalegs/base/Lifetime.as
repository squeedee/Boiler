package metalegs.base {
	import hookableSuspenders.HookableInjector;

	/**
	 * Lifetime is a SwistSuspenders/HookableSuspenders Injector with setup/teardown configuration support
	 * built in.
	 *
	 * It embodies the concept of the metalegs::base framework, which is that a simple extensible
	 * architecture can be built out of a DIContainer that supports pre-post hooks and a simple configuration
	 * scheme.
	 *
	 * By design, you should not add methods to Lifetime. Instead extend lifetime and during construction, add
	 * configuration handlers for extension points to the framework.
	 *
	 * In avoiding methods, you leave other frameworks and consumers the opportunity to add extensions of their own
	 * without running into multiple-inheritence issues. For more details, see the Metalegs documentation and website.
	 */
	public class Lifetime extends HookableInjector {
		private var configurationHandlers:ConfigurationCollection;

		public function Lifetime(xmlConfig:XML = null) {
			super(xmlConfig);
			mapValue(Lifetime, this);
			configurationHandlers = new ConfigurationCollection(this);
		}

		/**
		 * Framework developers should not call this method.
		 *
		 * This method is for the application developer to call when they are satisfied their configuration is ready.
		 *
		 * This method can only ever be called once per instance of Lifetime.
		 *
		 * @example
		 *   public class MyAppLifetime extends FrameworkLifetime {
		 *	 public function MyAppLifetime() {
		 *	   super()
		 *	   addConfigurationHandler(MyAppConfiguration);
		 *	   live();
		 *	 }
		 *   }
		 */
		public function live():void {
			configurationHandlers.startup();
		}

		/**
		 * Framework developers should not call this method
		 *
		 * This method is for the application developer to call when they want to clean up their app/module.
		 *
		 * You should use this, it can give all active members of the system a chance to release handlers and garbage
		 * collect.
		 *
		 * Do not use it for 'shutdown' procedures such as closing connections/streams etc. You should set up a framework
		 * level solution such as a shutdown command, which when finished (possibly asynchronously) invokes this method.
		 *
		 * This method can only ever be called once per instance of lifetime, and it must be called after #live
		 */
		public function die():void {
			configurationHandlers.teardown();
		}

		/**
		 * For everone's use.
		 *
		 * Add your configurations (before #live is called) here. They will be executed in the order they are added after
		 * #live is called.
		 *
		 * Usually you will add configurations in your Lifetime's constructor, however you may wish to do so within
		 * another configuration. If you do add a configuration within another configuration, it won't be run until the
		 * end of the configuration stack. You can utilise this as a framework developer to add mapping/instance handlers
		 * that run after application developer's handlers do.
		 *
		 * @todo better documentation of the configuration/startup/instance/mapping sequences.
		 *
		 * @param type Any class that implements the ConfigurationHandler interface.
		 * @return this Liftime object, allowing for fluent use.
		 */
		public function addConfigurationHandler(type:Class):Lifetime {
			configurationHandlers.add(type);
			return this;
		}

	}
}
