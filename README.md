# Preloader for Starling

SWFs running in a web browser should have preloaders. How do you create a preloader for a Starling app? Here's how I do it.

1. Extend `flash.display.MovieClip` when creating the document class.

2. Use this compiler argument to put a class on frame 2.

	-frame two,com.example.Main

3. When the SWF is completely loaded, call `gotoAndStop(2)`.

4. Call `getDefinitionByName( "com.example.Main" )` to access the class at runtime.

Please see the comments in the example code for more detailed explanation.