Motherlode.module 'Workspace.Footer', (Footer, Motherlode, Backbone, Marionette, $, _) ->
  log arguments

  Footer.Footer = Marionette.ItemView.extend
    template: "backbone/templates/workspace/footer"

    initialize: ->
      log "Workspace.Footer::initialize"