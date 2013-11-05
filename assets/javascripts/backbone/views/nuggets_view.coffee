Motherlode.Views.NuggetListView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/list"]
  el: "#backbone-container"

  events:
    "click .addNugget"      : "addNugget"
    "click .editNugget"     : "editNugget"
    "click .delNugget"      : "delNugget"

  initialize: ->
    @render()
    @view = new Motherlode.Views.ModeratedListView()
    @$el.find('#nuggets-grid-container').html @view.render().el

  addNugget: ->
    console.log "addNugget not implemented yet"

  editNugget: ->
    console.log "editNugget not implemented yet"

  delNugget: ->
    console.log "delNugget not implemented yet"

  render: ->
    @$el.html @template()
    @

Motherlode.Views.ModeratedListView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/moderated"]
  el: "#nuggets-grid-container"
  tagName: "div"

  initialize: ->
    @collection = new Motherlode.Collections.Nuggets()
    @collection.on('add', @addOne, @)
    @collection.on('reset', @render, @)
    @collection.reset()
    @render()
    @addAll()

  addAll: ->
    @collection.fetch()

  addOne: (entry) ->
    @view = new Motherlode.Views.NuggetEntryView({model: entry})
    @$el.find('tbody').html @view.render().el

  render: ->
    @$el.html @template()
    @

Motherlode.Views.UnmoderatedListView = Backbone.View.extend
  template: JST["backbone/templates/nuggets/unmoderated"]
  el: "#nuggets-grid-container"
  tagName: "div"

  events:
    "click .selNugget" : "selNugget"

  initialize: ->
    @render()

  selNugget: ->
    console.log @view
    console.log @view.closest('tr').html()
    @$el.closest('tr').css("background-color", "yellow")

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