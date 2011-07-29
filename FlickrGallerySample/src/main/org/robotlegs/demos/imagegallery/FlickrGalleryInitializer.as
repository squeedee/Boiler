package org.robotlegs.demos.imagegallery {
	import boiler.base.Initializer;
	import boiler.base.Lifetime;

	import flash.display.DisplayObject;

	import org.robotlegs.demos.imagegallery.configuration.FlickrGalleryConfiguration;

	public class FlickrGalleryInitializer implements Initializer {

		private var root:DisplayObject;

		public function FlickrGalleryInitializer(root:DisplayObject) {
			this.root = root;
		}

		public function run(lifetime:Lifetime):void {
			lifetime.addConfigurationHandler(FlickrGalleryConfiguration);
			lifetime.mapValue(DisplayObject, root);
		}
	}

}
