Motherlode.Models.User = Backbone.Model.extend
  paramRoot: "user"
  url: "/u/:id"
  defaults:
    _id: null
    title: ""
    username: null
    password: null
    name: null

  parse: (response, options) ->
    return response

Motherlode.Collections.Users = Backbone.Collection.extend
  model: Motherlode.Models.User
  url: "/u"