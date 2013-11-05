Motherlode.Views.CountiesListView = Backbone.View.extend
  template: JST["backbone/templates/counties/list"]
  el: '#backbone-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @