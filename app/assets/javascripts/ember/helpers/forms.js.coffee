Handlebars.registerHelper "submitButton", (text) ->
  new Handlebars.SafeString("<button class=\"btn\" type=\"submit\">" + text + "</button>")