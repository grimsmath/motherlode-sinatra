@Motherlode.module "Categories", (Entities, App, Backbone, Marionette, $, _) ->

  Entities.Category = Backbone.MongoModel.extend
    url: '/c/:id'

  Entities.CategoryCollection = Backbone.Collection.extend
    model: Entities.Category
    url: '/c'

  API =
    getCategories: ->
      new Entities.CategoryCollection().fetch()

  App.reqres.setHandler "category:entities", ->
    API.getCategories()