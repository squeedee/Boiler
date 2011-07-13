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
	
## Architecture

<script src="http://www.gliffy.com/diagramEmbed.js" type="text/javascript"> </script>
<script type="text/javascript"> gliffy_did = "2791221"; embedGliffy(); </script>

