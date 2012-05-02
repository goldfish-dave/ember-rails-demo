App.PostsShowView = Ember.View.extend(
  templateName: "ember/templates/posts/show"

  doubleClick: (event) ->
    @showEdit()
    false

  showEdit: ->
    @set "isEditing", true

  hideEdit: ->
    @set "isEditing", false

  destroyRecord: ->
    post = @get("post")
    post.deleteRecord()
    App.store.commit()
    App.router.set('location','posts')
)