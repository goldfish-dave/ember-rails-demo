App.PostIndexView = Ember.View.extend(
  templateName: "ember/templates/posts/index"
  postsBinding: "App.postsController"

  refreshListing: ->
    App.postsController.findAll()
)