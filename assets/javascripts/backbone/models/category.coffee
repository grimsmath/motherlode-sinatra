Motherlode.Models.Category = Backbone.Model.extend
  paramRoot: "category"
  url: "/c/:id"

Motherlode.Collections.Categories = Backbone.Collection.extend
  model: Motherlode.Models.Category
  url: "/c"
