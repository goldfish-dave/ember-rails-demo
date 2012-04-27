EmberRailsDemo.PostsController = Ember.ArrayController.extend(
  loadAll: (data) ->
    @findAll()

  findAll: ->
    @set 'content', EmberRailsDemo.store.findAll(EmberRailsDemo.Post)
)
EmberRailsDemo.postsController = EmberRailsDemo.PostsController.create()