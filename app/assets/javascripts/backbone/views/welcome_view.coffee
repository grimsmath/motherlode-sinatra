Motherlode.Views ?= {}

Motherlode.Views.WelcomeView = Backbone.View.extend
  template: JST["backbone/templates/main/welcome"]

  render: ->
    $(this.el).html(this.template())
    return this