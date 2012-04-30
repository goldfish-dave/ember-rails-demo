#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./router

# overall app
window.App = Ember.Application.create()

# namespacing for classes
App.Models = {}
App.Controllers = {}
App.Views = {}

# namespacing for real objects
App.models = {}
App.controllers = {}
App.views = {}

App.store = DS.Store.create(
  adapter: DS.RESTAdapter.create(bulkCommit: false)
  revision: 4
)

$ ->
  App.controllers.posts.findAll()
  App.views.main.appendTo('body')
  App.router.start()

App.displayError = (e) ->
  if typeof e is "string"
    alert e
  else if typeof e is "object" and e.responseText isnt `undefined`
    alert e.responseText
  else
    alert "An unexpected error occurred."