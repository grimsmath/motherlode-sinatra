Motherlode.Views ?= {}

Motherlode.Views.NuggetListView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/list"]

  model: "nugget"

  render: ->
    $(this.el).html(this.template(model: @model))
    return this

Motherlode.Views.NuggetShowView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/show"]

  model: "nugget"

  render: ->
    $(this.el).html(this.template(model: @model))
    return this

Motherlode.Views.NuggetEditView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/edit"]

  model: "nugget"

  render: ->
    $(this.el).html(this.template)
    return this