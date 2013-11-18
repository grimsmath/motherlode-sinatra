Motherlode.Models.Category = Backbone.Model.extend
  paramRoot: "category"
  url: "/c/:id"
  idAttribute: "_id"
  defaults:
    _id: null
    title: null
    username: null
    password: null

  parse: (response) ->
    response._id = response._id['$oid']
    return response

Motherlode.Collections.Categories = Backbone.Collection.extend
  model: Motherlode.Models.Category
  url: "/c"
