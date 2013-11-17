@Motherlode.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  log arguments

  Show.Controller =

    showHeader: ->
      headerView = @getHeaderView()
      App.regionHeader.show headerView

    getHeaderView: ->
      new Show.Header