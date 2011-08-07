package boiler.reflection.helpers {
	import mx.utils.StringUtil;

	public class EventClassNotSimpleError extends Error {
		public function EventClassNotSimpleError(className:String) {
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
