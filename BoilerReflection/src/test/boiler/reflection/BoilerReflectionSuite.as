package boiler.reflection {
	import boiler.reflection.helpers.EventDrivenMethodHelperClassTypeTest;
	import boiler.reflection.helpers.EventHelperEventTypesTest;
	import boiler.reflection.helpers.EventDrivenMethodHelperQualifierTest;
	import boiler.reflection.helpers.NamespaceHelperTest;
	import boiler.reflection.helpers.TypeHelperDescendanceTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class BoilerReflectionSuite {
		public var reflectOnAnEmptyClass:ReflectionOnAnEmptyClassTest;
		public var reflectOnAnEmptyClassWithMetadata:ReflectionOnAnEmptyClassWithMetadataTest;
		public var methodReflection:ReflectionOfMethodsTest;
		public var eventDrivenMethodHelperQualifier:EventDrivenMethodHelperQualifierTest;
		public var eventDrivenMethodHelperClassType:EventDrivenMethodHelperClassTypeTest;
		public var eventDrivenMethodHelperEventTypes:EventHelperEventTypesTest;
		public var namespaceHelper:NamespaceHelperTest;
		public var typeHelperDescendance:TypeHelperDescendanceTest;
	}
}
