#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates

window.EmberRailsDemo = Ember.Application.create()

EmberRailsDemo.store = DS.Store.create(
  adapter: DS.RESTAdapter.create(bulkCommit: false)
  revision: 4
)

EmberRailsDemo.routeManager = Ember.RouteManager.create(
  enableLogging: true
  posts: Ember.ViewState.create(
    route: "posts"
    view: EmberRailsDemo.PostIndexView
    index: Ember.ViewState.create(
      route: 'index'
      view: EmberRailsDemo.PostIndexView
    )
    show: Ember.ViewState.create(
      route: ":id"
      view: EmberRailsDemo.PostShowView
      enter: (stateManager, transition) ->
        @_super stateManager, transition
        params = stateManager.get("params")
        postId = params.id
    )
  )
)
EmberRailsDemo.displayError = (e) ->
  if typeof e is "string"
    alert e
  else if typeof e is "object" and e.responseText isnt `undefined`
    alert e.responseText
  else
    alert "An unexpected error occurred."