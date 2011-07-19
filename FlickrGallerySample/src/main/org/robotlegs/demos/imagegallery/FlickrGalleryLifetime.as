package org.robotlegs.demos.imagegallery {
	import flash.display.DisplayObject;

	import metalegs.mvcs.MVCSLifetime;

	import org.robotlegs.demos.imagegallery.configuration.FlickrGalleryConfiguration;

	public class FlickrGalleryLifetime extends MVCSLifetime {

		public function FlickrGalleryLifetime() {
			addConfigurationHandler(FlickrGalleryConfiguration);
		}

		private var _root:DisplayObject;

		public function set root(root:DisplayObject):void {
			if (_root != null)
				return;

			_root = root;
			
			mapValue(DisplayObject, root);
			live();
		}

	}

}
