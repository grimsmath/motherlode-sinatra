Motherlode.Models.Nugget = Backbone.Model.extend
  paramRoot: "nugget"
  url: "/n?u=mattwalston&p=pass"

Motherlode.Collections.Nuggets = Backbone.Collection.extend
  model: Motherlode.Models.Nugget
  url: "/n?u=mattwalston&p=pass"


