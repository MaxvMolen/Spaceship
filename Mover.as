package {

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;


	public class Mover extends MovieClip {

		var position;
		var velocity;
		var acceleration;
		var thrust: Number = 0;
		var vr: Number = 0;
		var vx: Number = 0;
		var vy: Number = 0;
		var maxThrust: Number = 5;
		var turn: Number = 2;
		var f;


		public function Mover() {
			this.position = new Vector2(50, 50);
			this.velocity = new Vector2(0, 0);
			this.acceleration = new Vector2(vx, vy);


			addEventListener(Event.ENTER_FRAME, Update);
		}

		public function Events() {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
		}

		private function applyThrust(): void {
			var angle: Number = this.rotation * Math.PI / 180;
			var ax: Number = Math.cos(angle) * thrust;
			var ay: Number = Math.sin(angle) * thrust;
			this.vx += ax;
			this.vy += ay;
		}

		public function keyDownListener(e: KeyboardEvent) {

			if (e.keyCode == Keyboard.LEFT) {
				this.rotation -= turn;
				trace(rotation);
			}

			if (e.keyCode == Keyboard.UP) {
				trace(rotation);
				this.thrust = maxThrust;
			}

			if (e.keyCode == Keyboard.RIGHT) {
				this.rotation += turn;
				trace(rotation);
			}

			if (e.keyCode == Keyboard.DOWN) {
				if (thrust >= 0.1) {
					this.thrust--;
				}
			}
		}


		public function Update(e: Event) {
			
			this.x = position.x;
			this.y = position.y;

			this.x += vx;
			this.y += vy;

			applyThrust();

			this.velocity.add(this.acceleration);
			this.position.add(this.velocity);

		}

	}

}