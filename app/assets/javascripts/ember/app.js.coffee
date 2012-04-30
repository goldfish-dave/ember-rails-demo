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

# namespacing for instances
App.models = {}
App.controllers = {}
App.views = {}

# specify the adapter for accessing with ember-data
App.store = DS.Store.create(
  adapter: DS.RESTAdapter.create(bulkCommit: false)
  revision: 4
)

$ ->
  App.controllers.posts.findAll()
  # DOM placement, all views will hang off this one
  App.views.main.appendTo('body')
  App.router.start()