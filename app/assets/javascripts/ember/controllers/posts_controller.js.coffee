App.Controllers.Posts = Ember.ArrayController.extend(
  loadAll: (data) ->
    @findAll()

  findAll: ->
    @set 'content', App.store.findAll(App.Models.Post)
)
App.controllers.posts = App.Controllers.Posts.create()
