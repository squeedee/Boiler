## Boiler is about convention

  * Add a DI mapping of a class, it's namespace and/or structure will do the rest (Like Rails)
  * Add Metadata only when you can't depend on convention
  * Change the conventions by injecting different 'detectors'

## Boiler is about extensibility
  
  * Does not add methods that then get stuck in polymorphic inheritance hell. 
  * Let's you configure the order that 'detectors' are run in.
  * Let's you define the kinds of mapping and injections that 'detectors' run on. 

I need to show an example of how to add sugar, and what to avoid. I have no problem with using sugar, but it has no place being a dependent part of the framework.

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

## MVCS Configurations

### Notifier (Event Based)
A simple notification bus

### SignalNotifier (Planned)

An as3-Signals based notification bus

### Dispatcher (Done for events)

A configuration that can be told to listen for events/signals on one or more notifiers and execute a specific class/method 

May need splitting into Dispatcher and SignalDispatcher - however I think this can be avoided. It's quite a generic approach.

### Controller (Done for Events) 

A configuration that is aware of mappings that look like controllers. It picks up controller methods and adds them to the Dispatcher.

To be a controller, a class needs only be:
  
  * nested in a namespace called "controller": modules.coolThing.controllers.AControlClass
  * end with "Controller": modules.coolThing.actionerators.CoolController
  * have class metadata [Controller]: [Controller] public class AControlClass {}  

To have methods called, a controller class must define methods with a single parameter, which is either an event or signal.

### DisplayTreeInstancer (Planned)

A configuration aware of Display tree events. It watches the events and asks the injector to instance class(es) mapped to be created whenever the display component is added.

### Mediator (Planned)

A configuration that is aware of mappings that look like they expect a view to be injected. It picks them up and adds them to the DisplayTreeInstancer to ensure the mediator(s) get built and injected with the views.

To be a mediator, a class needs only be:

  * NOT a display-object  
  * nested in a namespace called "view"
  * nested in a namespace called "mediator"
  * have class metadata [Mediator] 
  * have public access metadata [View]

Notice, this mechanism gives us multi-mediation for free.
