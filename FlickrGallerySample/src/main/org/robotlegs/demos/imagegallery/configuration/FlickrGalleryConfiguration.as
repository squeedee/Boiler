package org.robotlegs.demos.imagegallery.configuration {
	import boiler.base.configuration.ConfigurationBase;
	import boiler.steam.SteamConfiguration;

	import flash.display.DisplayObject;

	import org.robotlegs.demos.imagegallery.controller.GalleryController;
	import org.robotlegs.demos.imagegallery.controller.SelectedImageController;
	import org.robotlegs.demos.imagegallery.models.GalleryModel;
	import org.robotlegs.demos.imagegallery.remote.services.FlickrImageService;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.demos.imagegallery.views.mediators.GalleryLabelMediator;
	import org.robotlegs.demos.imagegallery.views.mediators.GallerySearchMediator;
	import org.robotlegs.demos.imagegallery.views.mediators.GalleryViewMediator;

	public class FlickrGalleryConfiguration extends ConfigurationBase {
		private var _root:DisplayObject;


		override public function startup():void {

			// steam mediator pre-requisites
			lifetime.mapValue(DisplayObject, _root);

			// introduce steam
			lifetime.runConfiguration(SteamConfiguration);

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

			// Steam mediator pre-requisites
			lifetime.unmap(DisplayObject);
			
		}

		public function get root():DisplayObject {
			return _root;
		}

		public function set root(value:DisplayObject):void {
			trace("A Set Root");
			_root = value;
		}

	}
}
