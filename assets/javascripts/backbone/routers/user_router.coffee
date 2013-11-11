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
    "user"              : "showProfile"

  initialize: ->
    if not @users?
      @users = new Motherlode.Collections.Users()
      @initCollections()

  initCollections: ->
    @users.reset()
    @users.fetch()

  showProfile: ->
    console.log "showProfile is not implemented yet"

  showUsers: ->
    @view = new Motherlode.Views.UsersListView({collection: @users})

  doLogin: ->
    console.log "doLogin is not implemented yet"

  doLogout: ->
    console.log "doLogout is not implemented yet"

  doReset: ->
    console.log "doReset is not implemented yet"

  addUser: ->
    console.log "addUser called"
    @view = new Motherlode.Views.UserEditView({model: null})

  showUser: (id) ->
    console.log "showUser called"
    user = @users.get(id)
    console.log user
    @view = new Motherlode.Views.UserShowView({model: user})

  editUser: (id) ->
    console.log "editUser called"
    console.log @users
    user = @users.get(id)
    console.log user
    @view = new Motherlode.Views.UserEditView({model: user})

  delUser: (id) ->
    console.log "delUser called"
    user = @users.get(id)
    @users.remove(user)