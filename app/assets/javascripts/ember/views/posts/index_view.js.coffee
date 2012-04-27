EmberRailsDemo.PostIndexView = Ember.View.extend(
  templateName: "ember/templates/posts/index"
  postBinding: "EmberRailsDemo.postsController"

  showNew: ->
    @set "isNewVisible", true

  hideNew: ->
    @set "isNewVisible", false

  refreshListing: ->
    EmberRailsDemo.postsController.findAll()
)