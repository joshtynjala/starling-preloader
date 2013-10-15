# Preloader for Starling

SWFs running in a web browser should have preloaders. How do you create a preloader for a Starling app? It's not really any different than creating a preloader for any other SWF. Here's how I do it.

1. Extend `flash.display.MovieClip` when creating the document class.

2. Use this command line argument to put a class on frame 2 (change the package and class name to match your project's root Starling class).

	-frame two,org.josht.examples.preloader.Main

3. When the SWF is completely loaded, call `gotoAndStop(2)`.

4. Call `getDefinitionByName()` to access classes at runtime from frame 2 (you only need to do this in the document class).

Please see the comments in the example code for more detailed explanation.

This project is not designed to create a preloader with Flash Professional. It is meant as an example for Flash Builder or any other development environment that uses the command line compiler.