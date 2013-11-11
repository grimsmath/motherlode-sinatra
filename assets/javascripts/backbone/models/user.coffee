Motherlode.Models.User = Backbone.Model.extend
  paramRoot: "user"
  url: "/u/:id"
  idAttribute: "_id"
  defaults:
    _id: null
    name: null
    email: null
    username: null
    password: null

  parse: (response) ->
    response._id = response._id['$oid']
    return response

Motherlode.Collections.Users = Backbone.Collection.extend
  model: Motherlode.Models.User
  url: "/u"