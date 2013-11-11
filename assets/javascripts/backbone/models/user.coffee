Motherlode.Models.User = Backbone.Model.extend
  paramRoot: "user"
  url: "/u/:id"

Motherlode.Collections.Users = Backbone.Collection.extend
  model: Motherlode.Models.User
  url: "/u"