Motherlode.Routers.UserRouter = Backbone.Router.extend
  routes:
    "users"             : "showUsers"
    "user"              : "showProfile"
    "user/login"        : "doLogin"
    "user/logout"       : "doLogout"
    "user/reset"        : "doReset"
    "user/:id"          : "showUser"
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
    @AddView = new Motherlode.Views.UsersEditView()

  showUser: (id) ->
    console.log "showUser is not implemented yet"

  editUser: (id) ->
    console.log "editUser is not implemented yet"

  delUser: (id) ->
    console.log "delUser is not implemented yet"