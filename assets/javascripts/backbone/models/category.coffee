Motherlode.Models.Category = Backbone.Model.extend
  paramRoot: "category"
  url: "/c/:id"
  defaults:
    id: null
    title: ""
    username: null
    password: null

  parse: (response, options) ->
    return response

Motherlode.Collections.Categories = Backbone.Collection.extend
  model: Motherlode.Models.Category
  url: "/c"
