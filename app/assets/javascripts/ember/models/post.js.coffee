App.Post = DS.Model.extend(
  title: DS.attr("string")
  body: DS.attr("string")
  comments: DS.hasMany('App.Comment')

  validate: ->
    if @get("title") is `undefined` or @get("title") is "" or @get("body") is `undefined` or @get("body") is ""
      "Posts require a title and body."
)