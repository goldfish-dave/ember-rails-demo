( ->
  Emberpusher = (channel, store, model) ->
    @channel = channel
    @store = store
    @model = model

    @channel.bind "created", (pushed_model) =>
      console?.log('created' + pushed_model)
      foo = @store.find(@model,pushed_model.id)
      if foo.get('id')
        foo.setProperties(pushed_model)
      else
        @store.load(@model, pushed_model)

    @channel.bind "updated", (pushed_model) =>
      console?.log('updated' + pushed_model)
      foo = @store.find(@model,pushed_model.id)
      if foo.get('id')
        foo.setProperties(pushed_model)
      else
        @store.load(@model, pushed_model)

    @channel.bind "destroyed", (pushed_model) =>
      console?.log('destroyed' + pushed_model)
      foo = @store.find(@model,pushed_model.id)
      if foo.get('id')
        foo.deleteRecord()

  @Emberpusher = Emberpusher
).call this
