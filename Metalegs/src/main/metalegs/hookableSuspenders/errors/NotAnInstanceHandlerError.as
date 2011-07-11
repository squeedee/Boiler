package metalegs.hookableSuspenders.errors {
	import flash.utils.describeType;

	import mx.utils.StringUtil;

	public class NotAnInstanceHandlerError extends Error {

		public function NotAnInstanceHandlerError(handlerType:Class) {

			super(
					StringUtil.substitute(
							"{0} is not an InstanceHandler class.",
							describeType(handlerType).@name
					),
					894578189463
			);
		}

	}
}
