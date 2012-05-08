App.PostsIndexView = Ember.View.extend(
  templateName: "ember/templates/posts/index"
  postsBinding: "App.postsController.content"
)