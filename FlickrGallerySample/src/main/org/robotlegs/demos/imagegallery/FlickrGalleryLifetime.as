package org.robotlegs.demos.imagegallery {
	import flash.display.DisplayObject;

	import boiler.mvcs.MVCSLifetime;

	import org.robotlegs.demos.imagegallery.configuration.FlickrGalleryConfiguration;

	public class FlickrGalleryLifetime extends MVCSLifetime {

		public function FlickrGalleryLifetime() {
			addConfigurationHandler(FlickrGalleryConfiguration);
		}

		public function set root(root:DisplayObject):void {
			if (hasMapping(DisplayObject))
				return;

			mapValue(DisplayObject, root);
			live();
		}

		public function get root():DisplayObject {
			return getInstance(DisplayObject);
		}

	}

}
