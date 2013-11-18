Motherlode.module 'Workspace', (Workspace, Motherlode, Backbone, Marionette, $, _) ->

  Workspace.Header = Marionette.CompositeView.extend
    template: JST['backbone/templates/workspace/header']

    initialize: ->
      _.bindAll(@, 'render')

  Workspace.Content = Marionette.CompositeView.extend
    template: JST['backbone/templates/workspace/content']

    initialize: ->
      _.bindAll(@, 'render')

  Workspace.Footer = Marionette.CompositeView.extend
    template: JST['backbone/templates/workspace/footer']

    initialize: ->
      _.bindAll(@, 'render')
