Motherlode.Views.CategoriesListView = Backbone.View.extend
  template: JST["backbone/templates/categories/list"]
  el: '#backbone-container'

  events:
    "click .addCategory"      : "addCategory"
    "click .editCategory"     : "editCategory"
    "click .delCategory"      : "delCategory"

  initialize: ->
    @render()
    @collection = new Motherlode.Collections.Categories()
    @collection.reset()
    @collection.fetch()
    @view = new Motherlode.Views.CategoryEntryView({model: @collection})
    @$el.find('tbody').html @view.render().el

  addCategory: ->
    @AddView = new Motherlode.Views.CategoryEditView()

  editCategory: (id) ->
    @EditView = new Motherlode.Views.CategoryEditView()

  delCategory: (id) ->
    console.log "delCategory is not implemented yet"

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