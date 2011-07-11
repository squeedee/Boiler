require 'buildr/as3'

metalegs_layout = Layout.new
metalegs_layout[:source, :main, :as3] = 'src/main'
metalegs_layout[:source, :test, :as3] = 'src/test'

# We need these maven repositories to download the flexunit4 and junit files
repositories.remote << 
	"http://artifacts.devboy.org" << 
	"http://repo2.maven.org/maven2"

desc "Robotlegs inspired, responsibility-oriented-configuration framework and MVCS reference implementation."
define "Metalegs", :layout => metalegs_layout do

  DEFAULT_SDK = FlexSDK.new("3.5.0.12683")
  project.version = 
  
  define "Metalegs" do
  	compile.using :compc
    compile.options[:flexsdk] = DEFAULT_SDK
  end

	define "TimeAppSample" do
		compile.using :mxmlc
    compile.options[:flexsdk] = DEFAULT_SDK
	  compile.options[:main] = _(:src,:main,:as3) + "/Sample.mxml"
	end

end