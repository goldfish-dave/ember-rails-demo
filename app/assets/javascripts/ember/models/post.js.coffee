App.Models.Post = DS.Model.extend(
  title: DS.attr("string")
  body: DS.attr("string")

  validate: ->
    "Posts require a title and body."  if @get("title") is `undefined` or @get("title") is "" or @get("body") is `undefined` or @get("body") is ""

)
App.Models.Post.reopenClass(
  url: 'post'
)