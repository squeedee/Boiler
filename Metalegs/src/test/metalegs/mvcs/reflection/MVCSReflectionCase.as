package metalegs.mvcs.reflection {
	import metalegs.mvcs.reflection.fixtures.EmptyClassWithMetadata;

	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.assertThat;
	import org.hamcrest.number.greaterThan;

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

			assertTrue(reflection.includesClassMetadata());
		}

		[Test(
				given="An empty class with class metadata",
				it="Has class Metadata"
				)]
		public function ItHasClassMetadata():void {
			withAnEmptyClassWithMetadata();

			assertThat(reflection.type().metadata.length(), greaterThan(0));

		}

		private function withAnEmptyClassWithMetadata():void {
			reflection.reflect(EmptyClassWithMetadata);
		}

	}
}


