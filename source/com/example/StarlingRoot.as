package com.example
{
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * The root Starling display object. No special code is required here to
	 * enable the preloader.
	 */
	public class StarlingRoot extends Sprite
	{
		public function StarlingRoot()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}

		/**
		 * If you see the Quad, everything has been loaded correctly.
		 */
		protected function addedToStageHandler(event:Event):void
		{
			const quad:Quad = new Quad(100, 100, 0xff00ff);
			quad.x = (this.stage.stageWidth - quad.width) / 2;
			quad.y = (this.stage.stageHeight - quad.height) / 2;
			this.addChild(quad);
		}
	}
}
