Motherlode.Views.UsersListView = Backbone.View.extend
  template: JST["backbone/templates/users/list"]
  el: '#backbone-container'

  initialize: ->
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

  render: ->
    @$el.html @template()
    @

Motherlode.Views.UserEntryView = Backbone.View.extend
  template: JST["backbone/templates/users/entry"]
  tagName: "tr"

  render: ->
    @$el.html @template(@model.toJSON())
    @

Motherlode.Views.UserShowView = Backbone.View.extend
  template: JST["backbone/templates/users/show"]
  el: "#backbone-container"

  initialize: ->
    @render()

  render: ->
    @$el.html @template(@model.toJSON())
    @

Motherlode.Views.UserEditView = Backbone.View.extend
  template: JST["backbone/templates/users/edit"]
  el: "#backbone-container"

  events:
    "click .save"   : "save"
    "click .cancel" : "cancel"

  initialize: ->
    @render()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    id = $('#id').val()
    username = $('#username').val()
    name = $('#name').val()
    email = $('#email').val()
    password = $('#password').val()

    console.log id
    console.log username
    console.log name
    console.log email
    console.log password

    @model.save
      id: id
      username: username
      name: name
      email: email
      password: password

      success: ->
        window.location.hash = "#users"

      @

  cancel: ->
    window.history.back()

  render: ->
    @$el.html @template(@model.toJSON())
    @

Motherlode.Views.UserLoginView = Backbone.View.extend
  template: JST["backbone/templates/users/login"]
  tagName: "div"

  initialize: ->
    @render()

  render: ->
    @$el.html @template()
    @