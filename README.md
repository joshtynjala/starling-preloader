# Preloader for Starling

SWFs running in a web browser should have preloaders. Preloaders allow you to display some kind of graphics while the rest of the SWF file loads so that visitors to your website don't get bored while waiting.

How do you create a preloader for a Starling app? It's not really any different than creating a preloader for any other SWF. Here's a summary of how I do it. Take a look at the included source code for complete details.

1. Extend `flash.display.MovieClip` when creating the startup class. Call `stop()` in the constructor.

2. Use the following command line argument to compile your Starling root class on frame 2 instead of frame 1. It's the class that you will pass to the Starling constructor. It usually extends `starling.display.Sprite`.
```
-frame two,org.josht.examples.preloader.StarlingRoot
```

3. Wait for the SWF to be completely loaded. Listen for `Event.COMPLETE` on the `loaderInfo` object.

4. In the `Event.COMPLETE` listener, call `gotoAndStop(2)` to switch to frame 2.

5. Get a reference to the Starling root class by calling `getDefinitionByName()`. **Do not import this class.** If you import it, it will be compiled on frame 1 instead of frame 2, and then the preloader won't work.
```as3
var RootType:Class = getDefinitionByName("org.josht.examples.preloader.StarlingRoot") as Class;
```

6. Call `getDefinitionByName()` again to get a reference to `starling.core.Starling`. Again, do not import this class.

7. Instantiate Starling using the classes returned by `getDefinitionByName()`.

Please see the comments in the example code for more detailed explanations.

This project is not designed to create a preloader with Flash Professional. It is meant as an example for Flash Builder or any other development environment that uses the command line compiler.