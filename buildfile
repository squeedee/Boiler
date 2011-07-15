require 'buildr/as3'

# Don't see the point in language subdirs on this project 
metalegs_layout = Layout.new
metalegs_layout[:source, :main, :as3] = 'src/main'
metalegs_layout[:source, :test, :as3] = 'src/test'

vendor_layout = Layout.new
vendor_layout[:source,:main,:as3] = 'src'

# We need these maven repositories to download the flexunit4 and junit files
repositories.remote << 
	"http://artifacts.devboy.org" << 
	"http://repo2.maven.org/maven2"

desc "Robotlegs inspired, responsibility-oriented-configuration framework and MVCS reference implementation."
define "Metalegs", :layout => metalegs_layout do

  # Do i need to build against 4 for 4 and 4.5 for 4.5? I guess I probably do. I wonder how I instruct buildr to do that
  DEFAULT_SDK = FlexSDK.new("3.5.0.12683")
  compile.options[:flexsdk] = DEFAULT_SDK
  
  # put this into a VERSION file so i can write a bumping task.. or does buildr let me write rake-like tasks?
  project.version = 0.0.1

  define "vendor", :layout => vendor_layout do
    define "SwiftSuspenders" do
      # todo keep Inject/PostConstruct
      compile.using :compc
    end
  end
  
  define "HookableSuspenders" do
    # todo depend on SS
    # todo keep Inject/PostConstruct
    # todo configure tests
    compile.using :compc
  end
  
  define "Metalegs" do
    # todo depend on HS
    # todo keep Inject/PostConstruct
    # todo configure tests
  	compile.using :compc
  end

	define "TimeAppSample" do
	  # todo depend on ML
		compile.using :mxmlc
	  compile.options[:main] = _(:src,:main,:as3) + "/Sample.mxml"
	end

end