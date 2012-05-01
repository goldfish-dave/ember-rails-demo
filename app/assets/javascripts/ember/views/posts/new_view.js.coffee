App.Views.Posts ||= {}
App.Views.Posts.NewView = Ember.View.extend(
  tagName: "form"
  templateName: "ember/templates/posts/edit"

  # different than edit to enable validation for new objects
  init: ->
    @_super()
    @transaction = App.store.transaction()
    @set "post", @transaction.createRecord(App.Post, {})

  # called when added to the dom, like viewDidLoad
  didInsertElement: ->
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