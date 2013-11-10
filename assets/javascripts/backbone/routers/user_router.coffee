Motherlode.Routers.CountyRouter = Backbone.Router.extend
  routes:
    "user"              : "showProfile"
    "user/login"        : "doLogin"
    "user/logout"       : "doLogout"
    "user/reset"        : "doReset"
    "user/:id"          : "showUser"
    "user/edit/:id"     : "editUser"
    "user/delete/:id"   : "delUser"

  showProfile: ->
    @view = new Motherlode.Views.ProfileView()

  doLogin: ->
    console.log "doLogin is not implemented yet"

  doLogout: ->
    console.log "doLogout is not implemented yet"

  doReset: ->
    console.log "doReset is not implemented yet"

  showUser: (id) ->
    console.log "showUser is not implemented yet"

  editUser: (id) ->
    console.log "editUser is not implemented yet"

  delUser: (id) ->
    console.log "delUser is not implemented yet"