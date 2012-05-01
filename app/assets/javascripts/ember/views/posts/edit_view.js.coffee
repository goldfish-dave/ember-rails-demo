App.Views.Posts ||= {}
App.Views.Posts.EditView = Ember.View.extend(
  tagName: "form"
  templateName: "ember/templates/posts/edit"
  classNames: ["form-horizontal"]

  # called when added to the dom, like viewDidLoad
  didInsertElement: ->
    @transaction = App.store.transaction()
    @transaction.add @get("post")
    @_super()
    @$("input:first").focus()

  cancelForm: ->
    @transaction.rollback()
    App.router.set('location','posts')

  submit: (event) ->
    post = @get("post")
    validationErrors = post.validate()
    event.preventDefault()
    if validationErrors isnt `undefined`
      App.displayError validationErrors
    else
      @transaction.commit()
      App.router.set('location','posts')
)