Motherlode.Views.CategoriesListView = Backbone.View.extend
  template: JST["backbone/templates/categories/list"]
  el: '#backbone-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.CategoryEntryView = Backbone.View.extend
  template: JST["backbone/templates/categories/entry"]
  tagName: "tr"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

Motherlode.Views.CategoryShowView = Backbone.View.extend
  template: JST["backbone/templates/categories/show"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.CategoryEditView = Backbone.View.extend
  template: JST["backbone/templates/categories/edit"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @