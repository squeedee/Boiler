package org.robotlegs.demos.imagegallery.configuration {
	import boiler.base.configuration.ConfigurationBase;

	import org.robotlegs.demos.imagegallery.controller.GalleryController;
	import org.robotlegs.demos.imagegallery.controller.SelectedImageController;
	import org.robotlegs.demos.imagegallery.models.GalleryModel;
	import org.robotlegs.demos.imagegallery.remote.services.FlickrImageService;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.demos.imagegallery.views.mediators.GalleryLabelMediator;
	import org.robotlegs.demos.imagegallery.views.mediators.GallerySearchMediator;
	import org.robotlegs.demos.imagegallery.views.mediators.GalleryViewMediator;

	public class FlickrGalleryConfiguration extends ConfigurationBase {

		override public function startup():void {

			// controllers
			lifetime.mapClass(GalleryController, GalleryController);
			lifetime.mapClass(SelectedImageController, SelectedImageController);

			// models
			lifetime.mapSingleton(GalleryModel);

			// services
			lifetime.mapSingletonOf(IGalleryImageService, FlickrImageService);
			//lifetime.mapSingletonOf( IGalleryImageService, XMLImageService );

			// mediators
			lifetime.mapClass(GalleryViewMediator, GalleryViewMediator);
			lifetime.mapClass(GallerySearchMediator, GallerySearchMediator);
			lifetime.mapClass(GalleryLabelMediator, GalleryLabelMediator);
		}

		override public function teardown():void {
			// mediators
			lifetime.unmap(GalleryLabelMediator);
			lifetime.unmap(GallerySearchMediator);
			lifetime.unmap(GalleryViewMediator);

			// services
			lifetime.unmap(IGalleryImageService);

			// models
			lifetime.unmap(GalleryModel);

			// Controllers
			lifetime.unmap(GalleryController);
			lifetime.unmap(SelectedImageController);

		}
	}
}
