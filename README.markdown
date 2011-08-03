Boiler is a complete IoC microarchitecture. It takes automated DI (from SwiftSuspenders) and tacks on inversion of control for configuration and initialisation. 

Boiler begs you to avoid writing a framework that lets people extend framework classes.

Steam is a reference framework emerging from Boiler
You probably want to start by looking at Steam or the FlickrGallerySample 

[Steam Docs](http://github.com/squeedee/Boiler/blob/master/steam_doc.textile) 

## Boiler is about convention

  * Add a DI mapping of a class, it's namespace and/or structure will do the rest (Like Rails)
  * Add Metadata only when you can't depend on convention
  * Change the conventions by injecting different 'detectors'

## Boiler is about extensibility
  
  * Does not add methods to the injector (called lifetime) other than the configuration support.
  * Sugar is added by injection or detection. You never base an actor on a superclass from the framework.
  * Configure the order that 'detectors' are run in.
  * Define the kinds of mapping and injections that 'detectors' run on.

Here's a poem:

      Invert Control.
 
    If you're writing a framework, and you don't want it to force people into a hole.
      Invert Control.
 
    When you think it's finished but something nags you about a classes role
      Invert Control

    When having to extend framework classes is not your goal...

      I N V E R T  C O N T R O L

# Architecture

## Absolute guiding principles

  * To be easily extensible
  * Very little boilerplate (but only lose it by injecting helpers!)
  * strict/strong typed
  * Does not stop you from leaning on your tools (I use Intellij's refactoring heavily)
  * Metadata never defines type (that includes 'names'). If metadata needs to attach to type, it should annotate strong typed, first class language constructs such as var and function.

## Still very incomplete

Lots of WIP, so don't be suprised at:
  
  * The lack of tests (Im not a TDDer, that might turn you off to begin with)
  * Sanity.. I'm not sane.

  [Current todo list](http://github.com/squeedee/Boiler/blob/master/todo.markdown)
	
## Shoulders of giants.

All of this is possible because of the amazing work of:

  * Robotlegs and the team.
  * SwiftSuspenders and Till.
  * Ruby On Rails and the team.
  * Ruby and the team.

## Architecture

![Layer Diagram](http://www.gliffy.com/pubdoc/2791221/L.png?1)
