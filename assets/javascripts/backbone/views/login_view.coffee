Motherlode.Views.LoginView = Backbone.View.extend
  template: JST["backbone/templates/auth/login"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @