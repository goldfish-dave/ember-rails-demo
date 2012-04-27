EmberRailsDemo.ShowPostView = Ember.View.extend(
  templateName: "ember/templates/posts/show"
  classNames: [ "show-post" ]
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