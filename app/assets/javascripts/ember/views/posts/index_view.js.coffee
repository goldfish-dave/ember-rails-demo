App.Views.Posts ||= {}
App.Views.Posts.IndexView = Ember.View.extend(
  templateName: "ember/templates/posts/index"
  postsBinding: "App.controllers.posts"
)