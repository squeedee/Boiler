package metalegs.mvcs.reflection {
	import metalegs.mvcs.reflection.fixtures.EmptyClassWithMetadata;

	import org.flexunit.asserts.assertTrue;

	public class MVCSReflectionCase {

		private var reflection:MVCSReflection;


		[Before]
		public function setup():void {
			reflection = new MVCSReflection();
		}

		[Test(
				given="An empty class with class metadata",
				it="Sets includesClassMetadata to true"
				)]
		public function ItSetsIncludesClassMetadataToTrue():void {
			withAnEmptyClassWithMetadata();

			assertTrue(reflection.hasAnyNamespace("Metadata"));
		}

		private function withAnEmptyClassWithMetadata():void {
			reflection.reflect(EmptyClassWithMetadata);
		}

	}
}


