Motherlode.Models.Nugget = Backbone.Model.extend
  paramRoot: "nugget"
  url: "/n"
  defaults:
    id: null
    title: null
    username: null
    password: null

  parse: (response, options) ->
    return response

Motherlode.Collections.Nuggets = Backbone.Collection.extend
  model: Motherlode.Models.Nugget
  url: "/n"


