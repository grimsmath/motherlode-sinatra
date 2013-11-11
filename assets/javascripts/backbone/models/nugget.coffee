Motherlode.Models.Nugget = Backbone.Model.extend
  paramRoot: "nugget"
  url: "/n/:id"

Motherlode.Collections.Nuggets = Backbone.Collection.extend
  model: Motherlode.Models.Nugget
  url: "/n"


