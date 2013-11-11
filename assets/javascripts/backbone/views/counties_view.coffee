Motherlode.Views.CountiesListView = Backbone.View.extend
  template: JST["backbone/templates/counties/list"]
  el: '#backbone-container'

  events:
    "click .addCounty"      : "addCounty"
    "click .editCounty"     : "editCounty"
    "click .delCounty"      : "delCounty"

  initialize: ->
    @render()
    @collection = new Motherlode.Collections.Counties()
    @collection.reset()
    @collection.fetch()
    @view = new Motherlode.Views.CountyEntryView({model: @collection})
    @$el.find('tbody').html @view.render().el

  addCounty: ->
    @AddView = new Motherlode.Views.CountiesEditView()

  editCounty: (id) ->
    @EditView = new Motherlode.Views.CountiesEditView()

  delCounty: (id) ->
    console.log "delCounty is not implemented yet"

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.CountyEntryView = Backbone.View.extend
  template: JST["backbone/templates/counties/entry"]
  tagName: "tr"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

Motherlode.Views.CountiesShowView = Backbone.View.extend
  template: JST["backbone/templates/counties/show"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.CountiesEditView = Backbone.View.extend
  template: JST["backbone/templates/counties/edit"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @