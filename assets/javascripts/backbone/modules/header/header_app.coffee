@Motherlode.module 'HeaderApp', (HeaderApp, App, Backbone, Marionette, $, _) ->
  log arguments

  @startWithParent = false

  HeaderApp.Router = Marionette.AppRouter.extend
    appRoutes:
      "nuggets"     : "showNuggets"
      "categories"  : "showCategories"
      "users"       : "showUsers"

  API =
    showHeader: ->
      HeaderApp.Show.Controller.showHeader()

    showNuggets: ->
      log "showNuggets not yet implemented"

    showCategories: ->
      log "showCategories not yet implemented"

    showUsers: ->
      log "showUsers not yet implemented"

  HeaderApp.addInitializer ->
    @router = new HeaderApp.Router({
      controller: API
    })

  HeaderApp.on "start", ->
    API.showHeader()

