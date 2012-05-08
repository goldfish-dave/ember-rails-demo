App.Comment = DS.Model.extend(
  body: DS.attr("string")
  post: DS.belongsTo('App.Post')
  post_id: DS.attr('number')

  validate: ->
    if @get("body") is `undefined` or @get("body") is ""
      "Comments require a body."
)