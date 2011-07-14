I should explain what this is about.

I want an extensible microarchitecture for frameworks. 

## Absolute guiding principles

  * To be easily extensible
  * Very little boilerplate
  * strict/strong typed
  * Does not stop you from leaning on your tools (I use Intellij's refactoring heavily)

## Hypothesis

I think I can achieve these goals with the following concept.

  * Base the framework on a DI system. I started with SwiftSuspenders as I know it well.
  * Provide extension points to the mapping and injection actions of the DI system. (HookableSuspenders)
  * Provide a configuration layer that makes bootstrapping the system easy. (Base)
  * No method's are added to the framework by extensions, only metadata.
  * Metadata never defines type (that includes 'names'). If metadata needs to attach to type, it should annotate strong typed, first class language constructs such as var and function.

All configurations are kept seperate, so that, if you want to extend the framework, you extend base::lifetime, and include the configurations
from preceding plugins/extensions until you end up with the system you need. 

The controller extension is almost complete, which should demonstrate the concept pretty well.

Lots of WIP, so don't be suprised at:
  
  * The lack of tests (Im not a TDDer, that might turn you off to begin with)
  * The lack of teardown support. It's certainly intended, but I don't need it for a Proof Of Concept which this is now.
  * Sanity.. I'm not sane.
	
## Shoulders of giants.

None of which is not possible without:

  * Robotlegs and the team.
  * SwiftSuspenders and Till.
  * Ruby On Rails and the team.
  * Ruby and the team.

## Architecture

![Layer Diagram](http://www.gliffy.com/pubdoc/2791221/L.png)

## MVCS Configurations

### Notifier (Event Based)
A simple notification bus

### SignalNotifier (Planned)

An as3-Signals based notification bus

### Dispatcher (WIP)

A configuration that can be told to listen for events/signals on one or more notifiers and execute a specific class/method 

May need splitting into Dispatcher and SignalDispatcher - however I think this can be avoided. It's quite a generic approach.

### Controller (WIP) 

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
