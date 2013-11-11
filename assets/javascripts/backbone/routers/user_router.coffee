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
    @AddView = new Motherlode.Views.UserEditView()

  showUser: (id) ->
    console.log "showUser is not implemented yet"

  newUser: ->
    @NewView = new Motherlode.Views.UserEditView({model: null})

  editUser: (id) ->
    @EditView = new Motherlode.Views.UserEditView({model: @model})
    console.log "editUser is not implemented yet"

  delUser: (id) ->
    console.log "delUser is not implemented yet"