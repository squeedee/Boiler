package metalegs.mvcs.reflection {
	import metalegs.mvcs.reflection.fixtures.EmptyClassWithMetadata;

	import org.flexunit.asserts.assertNotNull;

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
				it="Has class instance xml"
				)]
		public function ItHasClassInstanceXML():void {
			withAnEmptyClassWithMetadata();

			assertNotNull(reflection.instance());
		}

		[Test(
				given="An empty class with class metadata",
				it="Has class Metadata"
				)]
		public function ItHasClassMetadata():void {
			withAnEmptyClassWithMetadata();

			assertThat(reflection.instance().metadata.length(), greaterThan(0));
		}

		private function withAnEmptyClassWithMetadata():void {
			reflection.reflect(EmptyClassWithMetadata);
		}

	}
}


