@Motherlode.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  Entities.User = Backbone.MongoModel.extend
    urlRoot: '/u'

  Entities.UserCollection = Backbone.Collection.extend
    model: Entities.User
    url: '/u'

  API =
    getUsers: ->
      log "Entities.API::getUsers"
      users = new Entities.UserCollection()
      users.fetch()
      return users

  App.reqres.setHandler "user:entities", ->
    API.getUsers()