Ember Rails Demo
=================

Using [Ember.js](http://www.emberjs.org), evaluate the following:

*   Simple form CRUD
*   Routing of resources - nested, with nav, pagination
*   Associations - has_many, belongs_to
*   Rails idiom and integration - shouldn't be an impedance mismatch
*   Data binding - views change automatically when data does
*   View Composition - weak, strong...just get it done
*   No Framework Poison Pills - that would be bugs and things that would jeopardize a production app
*   HAML/Coffeescript Friendly

Implementation Notes:

*   Serialization of JSON is done via [Active_Model_Serializers](https://github.com/josevalim/active_model_serializers). Currently requires a "scope" (that is, current_user-like object), hence the anemic user inclusion.
*   Pusher token expired.

Awesomeness:

*   Data Binding is awesome, though the Metamorph implementation seems extremely obtrusive (script tags surround template chunks).
*   View Composition is the best I've seen...think little widgets on the page each with their own "controller", epic. It is a gamechanger.

Issues:

*   Routing is a nightmare with the state machine implementation. It is verbose and seems to put controller level concerns in the router. Of course, that's probably my MVC paradigm.  Thinking of a giant state machine for a prod level app (57 lines for two resources) seems unpleasant.
*   Associations through Data were buggy. Gave me unease. It's alpha at the time of writing, will be better at 1.0.  Side-loading didn't do what I expected (made repeat requests though the serializer was passing the data in the right format, or so I thought)
*   Handlebars is the template of choice, as is pure JS.  Had issues getting Coffeescript to do the .property binding syntax (which I know is silly...js2coffee => exception)
*   Debugging was exceedingly difficult compared to the other frameworks I've used, mostly due to the run loop and state machines.
*   All these issues were being worked on at the time of writing

Summary:

*   Ember was not easy to figure out.  It's MVC paradigm may be more authentic but a Rails developer will be completely confused by it. An up to date guide from Core is needed (and in the works) to get Rails developers up to speed. Specifically on best practices and how separation of concerns is supposed to look between state/router, views, and controllers.
*   I plan to look at it again when it is a bit further down the road. It's view composition keeps bringing me back (as well as the strong Rails-core support).
*   More info can be found on the [blog](http://www.zhubert.com/blog/categories/emberjs/).

