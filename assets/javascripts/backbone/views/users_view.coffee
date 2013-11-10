Motherlode.Views.UsersListView = Backbone.View.extend
  template: JST["backbone/templates/users/list"]
  el: '#backbone-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.UsersEntryView = Backbone.View.extend
  template: JST["backbone/templates/users/entry"]
  tagName: "tr"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

Motherlode.Views.UsersShowView = Backbone.View.extend
  template: JST["backbone/templates/users/show"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.UsersEditView = Backbone.View.extend
  template: JST["backbone/templates/users/edit"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.UsersLoginView = Backbone.View.extend
  template: JST["backbone/templates/user/login"]
  tagName: "div"

  initialize: ->
    @render()

  render: ->
    @$el.html @template()
    @