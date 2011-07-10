package metalegs.mvcs.controller {
	import metalegs.mvcs.reflection.MVCSReflection;

	public interface  ControllerDetector {

		function isController(reflection:MVCSReflection):Boolean;
	}
}
