Motherlode.module 'Users', (Users, Motherlode, Backbone, Marionette, $, _) ->

  Users.User = Backbone.MongoModel.extend

  Users.UserCollection = Backbone.Collection.extend
    model: Users.User
    url: "/u"

    initialize: ->
      log 'USers.UserCollection::initialize'

  Users.getAll = ->
    log 'Users.getAll'

    if not Users.userList
      Users.userList = new Users.UserCollection()

    return Users.userList