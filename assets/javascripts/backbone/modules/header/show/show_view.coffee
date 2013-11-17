@Motherlode.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  log arguments

  Show.Header = Marionette.ItemView.extend
    template: 'header/show/templates/header'

    initialize: ->
      log 'Show.Header::initialize'