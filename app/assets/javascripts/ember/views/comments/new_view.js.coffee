App.CommentsNewView = Ember.View.extend(
  tagName: "form"
  templateName: "ember/templates/comments/new"
  classNames: ["form-horizontal"]

  # different than edit to enable validation for new objects
  init: ->
    @_super()
    @transaction = App.store.transaction()
    @set "comment", @transaction.createRecord(App.Comment, {})

  # called when added to the dom, like viewDidLoad
  didInsertElement: ->
    @_super()
    @$("input:first").focus()

  submit: (event) =>
    comment = @get("comment")
    comment.set('post_id',App.postsController.selectedPost.get('id'))
    validationErrors = comment.validate()
    event.preventDefault()
    if validationErrors isnt `undefined`
      App.displayError validationErrors
    else
      @transaction.commit()
)