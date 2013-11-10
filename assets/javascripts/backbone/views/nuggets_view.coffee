Motherlode.Views.NuggetListView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/list"]
  el: "#backbone-container"

  events:
    "click .addNugget"      : "addNugget"
    "click .editNugget"     : "editNugget"
    "click .delNugget"      : "delNugget"

  initialize: ->
    @render()
    @collection = new Motherlode.Collections.Nuggets()
    @collection.reset()
    @collection.fetch()
    @view = new Motherlode.Views.NuggetEntryView({model: @collection})
    @$el.find('tbody').html @view.render().el

  addNugget: ->
    @NewView = new Motherlode.Views.NuggetEditView()

  editNugget: ->
    console.log "editNugget not implemented yet"

  delNugget: ->
    console.log "delNugget not implemented yet"

  render: ->
    @$el.html @template()
    @

Motherlode.Views.NuggetEntryView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/entry"]
  tagName: "tr"

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