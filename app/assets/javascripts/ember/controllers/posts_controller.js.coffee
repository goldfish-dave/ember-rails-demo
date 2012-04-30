App.PostsController = Ember.ArrayController.extend(
  loadAll: (data) ->
    @findAll()

  findAll: ->
    @set 'content', App.store.findAll(App.Post)
)
App.postsController = App.PostsController.create()