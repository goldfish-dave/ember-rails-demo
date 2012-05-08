App.postsController = Ember.ArrayController.create(
  selectedPost: null

  # controllers can persist state nicely
  selectPost: (postId) ->
    @set 'selectedPost', App.store.find(App.Post,postId)

  findAll: ->
    @set 'content', App.store.findAll(App.Post) unless @get('content')

  # rather pointless transaction, also needs
  # error handling
  createPost: (data) ->
    @transaction = App.store.transaction()
    @transaction.createRecord(App.Post,data)
    @transaction.commit()


)