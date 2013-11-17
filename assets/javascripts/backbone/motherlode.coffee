@Motherlode = do (Backbone, Marionette) ->

  App = new Marionette.Application()

  App.addRegions
    regionHeader: '#header'
    regionContent: '#content'
    regionFooter: '#footer'

  App.addInitializer ->
    App.module("HeaderApp").start()
    App.module("UsersApp").start()

  App.on "initialize:after", (options) ->
    if Backbone.history
      Backbone.history.start()

  App