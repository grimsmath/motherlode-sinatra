@Motherlode.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  Entities.Nugget = Backbone.MongoModel.extend
    url: '/n/:id'

  Entities.NuggetCollection = Backbone.Collection.extend
    model: Entities.Nugget
    url: '/n'

  API =
    getNuggets: ->
      new Entities.NuggetCollection().fetch()

  App.reqres.setHandler "nugget:entities", ->
    API.getUsers()