Motherlode.module 'UsersApp', (UsersApp, Motherlode, Backbone, Marionette, $, _) ->
  log arguments

  @startWithParent = false

  API =
    list: ->
      UsersApp.List.Controller.list()

  UsersApp.on "start", ->
    API.list()