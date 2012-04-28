EmberRailsDemo.PostView = Ember.View.extend(
  templateName: "ember/templates/posts/post"
  classNames: [ "post-item" ]
  tagName: "tr"
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
    EmberRailsDemo.store.commit()
)