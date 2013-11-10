Motherlode.Views.CountiesListView = Backbone.View.extend
  template: JST["backbone/templates/counties/list"]
  el: '#backbone-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.CountiesEntryView = Backbone.View.extend
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