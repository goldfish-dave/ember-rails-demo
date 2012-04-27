EmberRailsDemo.NewPostView = Ember.View.extend(
  tagName: "form"
  templateName: "ember/templates/posts/edit"
  init: ->
    @_super()
    @transaction = EmberRailsDemo.store.transaction()
    @set "post", @transaction.createRecord(EmberRailsDemo.Post, {})

  didInsertElement: ->
    @_super()
    @$("input:first").focus()

  cancelForm: ->
    @transaction.rollback()
    @get("parentView").hideNew()

  submit: (event) ->
    post = @get("post")
    validationErrors = post.validate()
    event.preventDefault()
    if validationErrors isnt `undefined`
      EmberRailsDemo.displayError validationErrors
    else
      @transaction.commit()
      @get("parentView").hideNew()
)