Motherlode.Models.County = Backbone.Model.extend
  paramRoot: "county"
  url: "/o/:id"
  defaults:
    id: null
    title: ""
    username: null
    password: null

  parse: (response, options) ->
    return response

Motherlode.Collections.Counties = Backbone.Collection.extend
  model: Motherlode.Models.County
  url: "/o"