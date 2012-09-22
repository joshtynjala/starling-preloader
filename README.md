# Preloader for Starling

SWFs running in a web browser should have preloaders. How do you create a preloader for a Starling app? It's not really any different than creating a preloader for any other SWF. Here's how I do it.

1. Extend `flash.display.MovieClip` when creating the document class.

2. Use this compiler argument to put a class on frame 2.

	-frame two,com.example.Main

3. When the SWF is completely loaded, call `gotoAndStop(2)`.

4. Call `getDefinitionByName()` to access classes at runtime from frame 2 (only needed in the document class).

Please see the comments in the example code for more detailed explanation.