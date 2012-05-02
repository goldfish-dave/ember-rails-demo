App.postsController = Ember.ArrayController.create(
  loadAll: (data) ->
    @findAll()

  findAll: ->
    @set 'content', App.store.findAll(App.Post)
)