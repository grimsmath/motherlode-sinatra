Motherlode.Views.WelcomeView = Backbone.View.extend
  template: JST["backbone/templates/main/welcome"]
  el: '#backbone-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @