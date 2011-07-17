package metalegs.mvcs.displayInstanceFollower {
	import flash.events.IEventDispatcher;

	/**
	 * Yes it's a marker.. right now, it feels better than trying to pass the display event context
	 * into the framework. If you think you have a better idea, I am all ears.
	 */
	public interface DisplayContext extends IEventDispatcher {
	}
}
