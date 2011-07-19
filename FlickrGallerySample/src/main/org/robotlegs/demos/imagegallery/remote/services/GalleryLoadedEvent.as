package org.robotlegs.demos.imagegallery.remote.services {
	import flash.events.Event;

	import org.robotlegs.demos.imagegallery.models.vo.Gallery;

	public class GalleryLoadedEvent extends Event {
		public static const LOADED:String = "galleryLoaded";
		private var _gallery:Gallery;

		public function GalleryLoadedEvent(gallery:Gallery) {
			super(LOADED);

			_gallery = gallery;

		}

		override public function clone():Event {
			return new GalleryLoadedEvent(gallery);
		}

		public function get gallery():Gallery {
			return _gallery;
		}
	}
}
