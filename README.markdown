## Boiler is about convention

  * Add a DI mapping of a class, it's namespace and/or structure will do the rest (Like Rails)


  * Add Metadata only when you can't depend on convention


  * Change the conventions by injecting different 'detectors'

## Boiler is about extensibility
  
  * Does not add methods to the injector (called lifetime) other than the configuration support.
     * Note: Considering making lifetime final and adding a property for configs instead. I really want people to trust the lifetime to be one thing only.
     * Note: This would require an initialmappings property also?


  * Sugar is added by injection or detection. You never base an actor on a superclass from the framework.


  * Configure the order that 'detectors' are run in.


  * Define the kinds of mapping and injections that 'detectors' run on.


# Architecture

## Absolute guiding principles

  * To be easily extensible
  * Very little boilerplate
  * strict/strong typed
  * Does not stop you from leaning on your tools (I use Intellij's refactoring heavily)
  * Metadata never defines type (that includes 'names'). If metadata needs to attach to type, it should annotate strong typed, first class language constructs such as var and function.

## Still very incomplete

Lots of WIP, so don't be suprised at:
  
  * The lack of tests (Im not a TDDer, that might turn you off to begin with)
  * Sanity.. I'm not sane.
	
## Shoulders of giants.

All of this is possible because of the amazing work of:

  * Robotlegs and the team.
  * SwiftSuspenders and Till.
  * Ruby On Rails and the team.
  * Ruby and the team.

## Architecture

![Layer Diagram](http://www.gliffy.com/pubdoc/2791221/L.png?1)

## The real stuff is in 'steam'

Take a look at steam_doc
