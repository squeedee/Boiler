package org.robotlegs.demos.imagegallery.controller {
	import org.robotlegs.demos.imagegallery.models.GalleryModel;

	public class SelectedImageController {

		[Inject]
		public var galleryModel:GalleryModel;

		public function select(event:SelectImageEvent):void {
			if (event.image)
				galleryModel.setSelectedImage(event.image);
		}
	}
}
