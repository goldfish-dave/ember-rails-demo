App.NewPostView = Ember.View.extend(
  tagName: "form"
  templateName: "ember/templates/posts/edit"
  init: ->
    @_super()
    @transaction = App.store.transaction()
    @set "post", @transaction.createRecord(App.Post, {})

  didInsertElement: ->
    @_super()
    @$("input:first").focus()

  cancelForm: ->
    @transaction.rollback()
    #@get("parentView").hideNew()
    App.routeManager.set('location','posts')

  submit: (event) ->
    post = @get("post")
    validationErrors = post.validate()
    event.preventDefault()
    if validationErrors isnt `undefined`
      App.displayError validationErrors
    else
      @transaction.commit()
      #@get("parentView").hideNew()
      App.routeManager.set('location','posts')

)