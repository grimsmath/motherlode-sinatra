Motherlode.Routers.UserRouter = Backbone.Router.extend
  routes:
    "user/login"        : "doLogin"
    "user/logout"       : "doLogout"
    "user/reset"        : "doReset"
    "user/new"          : "newUser"
    "user/show/:id"     : "showUser"
    "user/edit/:id"     : "editUser"
    "user/delete/:id"   : "delUser"
    "users"             : "showUsers"

  initialize: ->
    if not @users?
      @users = new Motherlode.Collections.Users()
      @users.reset @users.previousModels
      @users.fetch()

  showUsers: ->
    @view = new Motherlode.Views.UsersListView({collection: @users})

  addUser: ->
    @view = new Motherlode.Views.UserEditView({model: null})

  showUser: (id) ->
    user = @users.get(id)
    console.log user
    @view = new Motherlode.Views.UserShowView({model: user})

  editUser: (id) ->
    console.log @users
    user = @users.get(id)
    console.log user
    @view = new Motherlode.Views.UserEditView({model: user})

  delUser: (id) ->
    user = @users.get(id)
    @users.remove(user)
    @users.save()

  doLogin: ->
    console.log "doLogin is not implemented yet"

  doLogout: ->
    console.log "doLogout is not implemented yet"

  doReset: ->
    console.log "doReset is not implemented yet"