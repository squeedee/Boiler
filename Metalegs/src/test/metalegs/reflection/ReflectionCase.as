package metalegs.reflection {
	import metalegs.reflection.fixtures.EmptyClassWithMetadata;
	import metalegs.reflection.Reflection;
	import metalegs.reflection.ReflectionBase;

	import org.flexunit.asserts.assertNotNull;

	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.assertThat;
	import org.hamcrest.number.greaterThan;

	public class ReflectionCase {

		private var reflection:Reflection;

		[Before]
		public function setup():void {
			reflection = new ReflectionBase();
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


