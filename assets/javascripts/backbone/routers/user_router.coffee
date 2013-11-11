Motherlode.Routers.UserRouter = Backbone.Router.extend
  routes:
    "users"             : "showUsers"
    "user"              : "showProfile"
    "user/login"        : "doLogin"
    "user/logout"       : "doLogout"
    "user/reset"        : "doReset"
    "user/new"          : "newUser"
    "user/show/:id"     : "showUser"
    "user/edit/:id"     : "editUser"
    "user/delete/:id"   : "delUser"

  initialize: ->
    @initCollections()

  initCollections: ->
    @users = new Motherlode.Collections.Users()
    @users.reset()
    @users.fetch()

  showProfile: ->
    console.log "showProfile is not implemented yet"

  showUsers: ->
    @UsersView = new Motherlode.Views.UsersListView()

  doLogin: ->
    console.log "doLogin is not implemented yet"

  doLogout: ->
    console.log "doLogout is not implemented yet"

  doReset: ->
    console.log "doReset is not implemented yet"

  addUser: ->
    @AddView = new Motherlode.Views.UserEditView({model: null})

  showUser: (id) ->
    user = @users.get(id)
    @ShowView = new Motherlode.Views.UserShowView({model: user})

  newUser: ->
    @NewView = new Motherlode.Views.UserEditView({model: null})

  editUser: (id) ->
    user = @users.get(id)
    @EditView = new Motherlode.Views.UserEditView({model: user})

  delUser: (id) ->
    console.log "delUser is not implemented yet"