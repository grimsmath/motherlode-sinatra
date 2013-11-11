Motherlode.Views.NuggetListView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/list"]
  el: "#backbone-container"

  events:
    "click .add"    : "add"

  initialize: ->
    @render()
    @collection = new Motherlode.Collections.Nuggets()
    @collection.reset()
    @collection.fetch()
    @view = new Motherlode.Views.NuggetEntryView({model: @collection})
    @$el.find('tbody').html @view.render().el

  add: ->
    console.log "addNugget called"
    @AddView = new Motherlode.Views.NuggetEditView()

  render: ->
    @$el.html @template()
    @

Motherlode.Views.NuggetEntryView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/entry"]
  tagName: "tr"

  events:
    "click .edit"   : "edit"
    "click .delete" : "delete"

  edit: ->
    @

  delete: ->
    @model.destroy()
    this.remove()
    return false

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

Motherlode.Views.NuggetShowView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/show"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.NuggetEditView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/edit"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @