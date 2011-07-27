require 'buildr/as3'

# Don't see the point in language subdirs on this project 
boiler_layout = Layout.new
boiler_layout[:source, :main, :as3] = 'src/main'
boiler_layout[:source, :test, :as3] = 'src/test'

vendor_layout = Layout.new
vendor_layout[:source, :main, :as3] = 'src'

flickr_layout = Layout.new
flickr_layout[:source,:main,:as3] = "."

# We need these maven repositories to download the flexunit4 and junit files
repositories.remote <<
    "http://artifacts.devboy.org" <<
    "http://repo2.maven.org/maven2"

desc "Robotlegs inspired, responsibility-oriented-configuration framework and MVCS reference implementation."
define "Boiler_Project", :layout => boiler_layout do

  # Do i need to build against 4 for 4 and 4.5 for 4.5? I guess I probably do. I wonder how I instruct buildr to do that
  DEFAULT_SDK = FlexSDK.new("4.5.1.21328")
  DEFAULT_SDK.default_options <<
      "-keep-as3-metadata+=Inject" <<
      "-keep-as3-metadata+=PostConstruct" <<
      "-keep-as3-metadata+=Controller" <<
      "-keep-as3-metadata+=Mediator"

  compile.options[:flexsdk] = DEFAULT_SDK

  # put this into a VERSION file so i can write a bumping task.. or does buildr let me write rake-like tasks?
  project.version = "0.0.1"

  define "vendor", :layout => vendor_layout do
    define "SwiftSuspenders" do
      compile.using :compc
      package :swc
    end
  end

  define "HookableSuspenders" do
    # todo depend on SS
    # todo configure tests
    compile.with projects("vendor:SwiftSuspenders")
    compile.using :compc
    package :swc
  end

  define "Boiler" do
    # todo depend on HS
    # todo keep Inject/PostConstruct
    # todo configure tests
    compile.with projects("HookableSuspenders")
    compile.using :compc
    package :swc
  end

  define "FlickrGallerySample", :layout => flickr_layout do
    compile.with projects("Boiler")
    compile.using :mxmlc
    compile.options[:main] = _(:src, :main, :as3) + "/BoilerFlickrGallery.mxml"
    package :swf
  end

end