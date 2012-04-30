App.Views.Posts ||= {}
App.Views.Posts.EditView = Ember.View.extend(
  tagName: "form"
  templateName: "ember/templates/posts/edit"
  didInsertElement: ->
    @transaction = App.store.transaction()
    @transaction.add @get("post")
    @_super()
    @$("input:first").focus()

  cancelForm: ->
    @transaction.rollback()
    @get("parentView").hideEdit()

  submit: (event) ->
    post = @get("post")
    validationErrors = post.validate()
    event.preventDefault()
    if validationErrors isnt `undefined`
      App.displayError validationErrors
    else
      @transaction.commit()
      @get("parentView").hideEdit()
)