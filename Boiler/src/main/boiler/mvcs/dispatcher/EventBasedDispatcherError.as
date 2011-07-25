package boiler.mvcs.dispatcher {
	import mx.utils.StringUtil;

	public class EventBasedDispatcherError extends Error {
		public function EventBasedDispatcherError(className:String) {
			super(
					StringUtil.substitute(
							"Events registered for dispatch must be 'Simple'. {0} is not simple. " +
									"It must have only one class constant",
							className
					),
					7825354238912
			);
		}
	}
}
