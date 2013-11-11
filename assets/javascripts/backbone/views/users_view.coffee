Motherlode.Views.UsersListView = Backbone.View.extend
  template: JST["backbone/templates/users/list"]
  el: '#backbone-container'

  events:
    "click .add"      : "add"

  initialize: ->
    @collection = new Motherlode.Collections.Users()
    @collection.on('add', @addOne, @)
    @collection.on('reset', @render, @)
    @collection.reset()
    @render()
    @addAll()

  addAll: ->
    @collection.fetch()
    @

  addOne: (entry) ->
    @view = new Motherlode.Views.UserEntryView({model: entry})
    @$el.find('tbody').html @view.render().el
    @

  add: ->
    @AddView = new Motherlode.Views.UserEditView()

  render: ->
    @$el.html @template()
    @

Motherlode.Views.UserEntryView = Backbone.View.extend
  template: JST["backbone/templates/users/entry"]
  tagName: "tr"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

Motherlode.Views.UserShowView = Backbone.View.extend
  template: JST["backbone/templates/users/show"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.UserEditView = Backbone.View.extend
  template: JST["backbone/templates/users/edit"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.UserLoginView = Backbone.View.extend
  template: JST["backbone/templates/users/login"]
  tagName: "div"

  initialize: ->
    @render()

  render: ->
    @$el.html @template()
    @