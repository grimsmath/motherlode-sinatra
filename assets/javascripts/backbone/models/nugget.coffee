Motherlode.Models.Nugget = Backbone.Model.extend
  paramRoot: "nugget"
  url: "/n"
  idAttribute: "_id"
  defaults:
    id: null
    title: null
    username: null
    password: null

  parse: (response) ->
    response._id = response._id['$oid']
    return response

Motherlode.Collections.Nuggets = Backbone.Collection.extend
  model: Motherlode.Models.Nugget
  url: "/n"


