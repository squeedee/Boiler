package boiler.reflection {
	import boiler.reflection.helpers.EventDrivenMethodHelperTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class BoilerReflectionSuite {
		public var reflectOnAnEmptyClass:ReflectionOnAnEmptyClassTest;
		public var reflectOnAnEmptyClassWithMetadata:ReflectionOnAnEmptyClassWithMetadataTest;
		public var methodReflection:ReflectionOfMethodsTest;
		public var eventDrivenMethodHelper:EventDrivenMethodHelperTest;
	}
}
