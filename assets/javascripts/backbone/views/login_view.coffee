Motherlode.Views.LoginView = Backbone.View.extend
  template: JST["backbone/templates/user/login"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @