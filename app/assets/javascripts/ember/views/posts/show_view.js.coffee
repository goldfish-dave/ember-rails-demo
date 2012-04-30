App.PostShowView = Ember.View.extend(
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
    App.routeManager.set('location','posts')
)