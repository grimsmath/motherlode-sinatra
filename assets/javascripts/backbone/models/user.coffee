Motherlode.Models.User = Backbone.Model.extend
  paramRoot: "user"
  url: "/u"
  idAttribute: "_id"
  defaults:
    _id: null
    title: ""
    username: null
    password: null
    name: null

  parse: (response) ->
    response._id = response._id['$oid']
    return response

Motherlode.Collections.Users = Backbone.Collection.extend
  model: Motherlode.Models.User
  url: "/u"