package {

	import flash.display.MovieClip;
	import flash.events.*;

	public class Program extends MovieClip {

		public var mover: Mover;

		public function Program() {

			mover = new Mover();
			this.addChild(mover);
			mover.Evens();

		}

	}

}