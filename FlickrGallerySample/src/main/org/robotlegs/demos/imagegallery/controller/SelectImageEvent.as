package org.robotlegs.demos.imagegallery.controller {

	import flash.events.Event;

	import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;

	public class SelectImageEvent extends Event {

		public static const SELECT:String = "selectImage";
		private var _image:GalleryImage;

		public function SelectImageEvent(image:GalleryImage = null) {
			super(SELECT);
			_image = image;
		}

		public function get image():GalleryImage {
			return _image;
		}

		override public function clone():Event {
			return new SelectImageEvent(image);
		}
	}
}