package boiler.reflection {
	import boiler.fixtures.boiler.reflection.EmptyClass;
	import boiler.fixtures.boiler.reflection.EmptyClassWithMetadata;

	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.hamcrest.assertThat;
	import org.hamcrest.number.greaterThan;

	public class ReflectionCase {

		private var reflection:Reflection;

		[Before]
		public function setup():void {
			reflection = new ReflectionBase();
		}

		[After]
		public function teardown():void {
			reflection = null;
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

			assertThat(reflection.classMetadata().length(), greaterThan(0));
		}

		[Test(
				given="An empty class with a namespace",
				it="Can find the leaf namespace"
				)]
		public function ItCanFindTheLeafNamespace():void {
			withAnEmptyClass();
			assertThat(reflection.hasLeafNamespace("reflection"));
		}

		[Test(
				given="An empty class with a namespace",
				it="Does not find a non-existant leaf namespace"
				)]
		public function ItDoesNotFindANonExistantLeafNamespace():void {
			withAnEmptyClass();
			assertFalse(reflection.hasLeafNamespace("notanamespace"));
		}

		[Test(
				given="An empty class with a namespace",
				it="Can find a non-leaf namespace"
				)]
		public function ItCanFindANonLeafNamespace():void {
			withAnEmptyClass();
			assertThat(reflection.hasAnyNamespace("fixtures"));

		}

		[Test(
				given="An empty class with a namespace",
				it="Does not find a non-existant non-leaf namespace"
				)]
		public function ItDoesNotFindANonExistantNonLeafNamespace():void {
			withAnEmptyClass();
			assertFalse(reflection.hasAnyNamespace("notanamespace"));

		}

		//*********** Givens ***********//

		private function withAnEmptyClassWithMetadata():void {
			reflection.reflect(EmptyClassWithMetadata);
		}

		private function withAnEmptyClass():void {
			reflection.reflect(EmptyClass);
		}

	}
}


