Motherlode.Views ?= {}

Motherlode.Views.LoginView = Backbone.View.extend
  template: JST["backbone/templates/auth/login"]

  render: ->
    $(this.el).html(this.template())
    return this