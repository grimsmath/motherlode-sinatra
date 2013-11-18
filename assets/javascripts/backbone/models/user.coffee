Motherlode.Models.User = Backbone.Model.extend
  paramRoot: "user"
  idAttribute: "_id"

  parse: (response) ->
    response._id = response._id['$oid']
    response.id = response._id

    if not response.username?
      response.username = "Username not set"

    if not response.password?
      response.password = "Password not set"

    if not response.name?
      response.name = "Name not set"

    return response

Motherlode.Collections.Users = Backbone.Collection.extend
  model: Motherlode.Models.User
  url: "/u"