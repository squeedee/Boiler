require 'buildr/as3'

# Don't see the point in language subdirs on this project 
boiler_layout = Layout.new
boiler_layout[:source, :main, :as3] = 'src/main'
boiler_layout[:source, :test, :as3] = 'src/SkipyDeDooDah'

vendor_layout = Layout.new
vendor_layout[:source, :main, :as3] = 'src'

# We need these maven repositories to download the flexunit4 and junit files
repositories.remote <<
    "http://artifacts.devboy.org" <<
    "http://repo2.maven.org/maven2"

desc "Robotlegs inspired, responsibility-oriented-configuration framework and MVCS reference implementation."
define "BoilerProject", :layout => boiler_layout do

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
    # todo configure tests
    compile.with projects("vendor:SwiftSuspenders")
    compile.using :compc
    package :swc
    doc.options[:flexsdk] = DEFAULT_SDK
  end

  define "Boiler" do
    # todo configure tests
    compile.with projects("HookableSuspenders")
    compile.using :compc

    # no more doc options yet.... bummer.
    doc.options[:flexsdk] = DEFAULT_SDK

    package :swc
  end

  define "FlickrGallerySample" do
    compile.with projects("Boiler")
    compile.using :mxmlc
    compile.from _("libs")
    compile.options[:main] = _(:source, :main, :as3) + "/BoilerFlickrGallery.mxml"
    package :swf
  end

end