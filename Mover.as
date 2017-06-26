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
		var mass;
		var topspeed;
		var dir = new Vector2();
		var angle;

		var left: uint = 37;
		var up: uint = 38;
		var right: uint = 39;
		var down: uint = 40;


		public function Mover() {
			this.position = new Vector2(50, 50);
			this.velocity = new Vector2(0, 0);
			this.acceleration = new Vector2(0, 0);

			this.topspeed = 5;

			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		public function Evens() {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
		}

		public function keyDownListener(e: KeyboardEvent) {
			 //trace(e.keyCode.toString());
			if (e.keyCode == Keyboard.LEFT) {
				//this.rotation = 90;
				this.rotation = -180;
				
			}
			if (e.keyCode == Keyboard.UP) {
				//this.rotation = 180;
				this.rotation = -90;
				
			}
			if (e.keyCode == Keyboard.RIGHT) {
				//this.rotation = 270;
				this.rotation = 0;
				 
			}
			if (e.keyCode == Keyboard.DOWN) {
				//this.rotation = 0;
				this.rotation = 90;
				
			}
		}


		public function Update(e: Event) {


			this.x = position.x;
			this.y = position.y;

			//acceleration = dir;

			this.velocity.add(this.acceleration);
			this.velocity.limit(this.topspeed);
			this.position.add(this.velocity);

			if (position.x > 550) {
				position.x = 1;
			}

			if (position.y > 400) {
				position.y = 1;
			}

			if (position.x < 1) {
				position.x = 550;
			}

			if (position.y < 1) {
				position.y = 400;

			}

		}

	}

}