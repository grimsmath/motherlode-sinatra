Motherlode.Views.UsersListView = Backbone.View.extend
  template: JST["backbone/templates/users/list"]
  el: '#backbone-container'

  events:
    "click .addUser"      : "addUser"
    "click .editUser"     : "editUser"
    "click .delUser"      : "delUser"

  initialize: ->
    @render()
    @collection = new Motherlode.Collections.Users()
    @collection.reset()
    @collection.fetch()
    @view = new Motherlode.Views.UserEntryView({model: @collection})
    @$el.find('tbody').html @view.render().el

  addUser: ->
    @AddView = new Motherlode.Views.UserEditView()

  editUser: (id) ->
    entry = @collection.get(id)
    @AddView = new Motherlode.Views.UserEditView({model: entry})

  delUser: (id) ->
    console.log "delUser is not implemented yet"

  render: ->
    @$el.html(@template)
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