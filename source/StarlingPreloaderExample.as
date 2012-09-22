package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.utils.getDefinitionByName;

	[SWF(width="960",height="640",frameRate="60",backgroundColor="#1a1a1a")]
	/**
	 * An example of a document class that displays a preloader for a Starling
	 * app. Uses the <code>-frame</code> compiler argument to include the root
	 * Starling display object on the second frame of the SWF rather than on the
	 * first frame. The first frame loads quickly and can display things on the
	 * native display list while the second frame is still loading.
	 *
	 * <p>DO NOT import or reference anything in this class that you do not want
	 * to include in the first frame. Carefully consider any decision to
	 * import any class that has embedded assets like images or sounds. If you
	 * need embedded assets in the preloader, they should be separate from the
	 * rest of your embedded assets to keep the first frame nice and small.</p>
	 *
	 * <p>The following compiler argument is required to make this work:</p>
	 * <pre>-frame=two,org.josht.examples.preloader.Main</pre>
	 *
	 * <p>Because our Main class is a Starling display object, and because we
	 * don't import starling.core.Starling in this class, the Starling Framework
	 * will also be included on frame 2 instead of frame 1.</p>
	 */
	public class StarlingPreloaderExample extends MovieClip
	{
		/**
		 * Just the height of the progress bar.
		 */
		private static const PROGRESS_BAR_HEIGHT:Number = 20;

		public function StarlingPreloaderExample()
		{
			//the document class must be a MovieClip so that things can go on
			//the second frame.
			this.stop();

			//the two most important events for preloading
			this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, loaderInfo_progressHandler);
			this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
		}

		/**
		 * This is typed as Object so that the compiler doesn't include the
		 * starling.core.Starling class in frame 1. We'll access the Starling
		 * class dynamically once the SWF is completely loaded.
		 */
		private var _starling:Object;

		/**
		 * You'll get occasional progress updates here. event.bytesLoaded / event.bytesTotal
		 * will give you a value between 0 and 1. Multiply by 100 to get a value
		 * between 0 and 100.
		 */
		private function loaderInfo_progressHandler(event:ProgressEvent):void
		{
			//this example draws a basic progress bar
			this.graphics.clear();
			this.graphics.beginFill(0xcccccc);
			this.graphics.drawRect(0, (this.stage.stageHeight - PROGRESS_BAR_HEIGHT) / 2,
				this.stage.stageWidth * event.bytesLoaded / event.bytesTotal, PROGRESS_BAR_HEIGHT);
			this.graphics.endFill();
		}

		/**
		 * The entire SWF has finished loading when this listener is called.
		 */
		private function loaderInfo_completeHandler(event:Event):void
		{
			//get rid of the progress bar
			this.graphics.clear();

			//go to frame two because that's where the classes we need are located
			this.gotoAndStop(2);

			//getDefinitionByName() will let us access the classes without importing
			const StarlingType:Class = getDefinitionByName("starling.core.Starling") as Class;
			const MainType:Class = getDefinitionByName("org.josht.examples.preloader.Main") as Class;
			this._starling = new StarlingType(MainType, this.stage);
			this._starling.start();

			//that's it!
		}
	}
}