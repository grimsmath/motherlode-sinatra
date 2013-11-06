Motherlode.Routers.CountyRouter = Backbone.Router.extend
  routes:
    "user"              : "showProfile"
    "user/login"        : "doLogin"
    "user/logout"       : "doLogout"

  showProfile: ->
    @view = new Motherlode.Views.ProfileView()

  doLogin: ->

  doLogout: ->