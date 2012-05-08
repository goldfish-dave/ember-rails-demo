App.PostsNewView = Ember.View.extend(
  tagName: "form"
  templateName: "ember/templates/posts/new"
  classNames: ["form-horizontal"]

  # different than edit to enable validation for new objects
  init: ->
    @_super()

  # called when added to the dom, like viewDidLoad
  didInsertElement: ->
    @_super()
    @$("input:first").focus()

  cancelForm: ->
    App.router.set('location','posts')

  submit: (event) ->
    formTitle = @get('title')
    formBody = @get('body')
    App.postsController.createPost({title: formTitle, body: formBody})
    event.preventDefault()
    App.router.set('location','posts')
)