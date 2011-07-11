package metalegs.hookableSuspenders.errors {
	import flash.utils.describeType;

	import mx.utils.StringUtil;

	public class NotAMappingHandlerError extends Error {
		public function NotAMappingHandlerError(handlerType:Class) {

			super(
					StringUtil.substitute(
							"{0} is not an InstanceHandler class.",
							describeType(handlerType).@name
					),
					47393649936
			);
		}
	}
}
