App.PostIndexView = Ember.View.extend(
  templateName: "ember/templates/posts/index"
  postBinding: "App.postsController"

  refreshListing: ->
    App.postsController.findAll()
)