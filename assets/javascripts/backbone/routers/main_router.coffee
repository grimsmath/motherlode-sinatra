Motherlode.Routers.MainRouter = Backbone.Router.extend
  routes:
    ""                      : "showWelcome"
    "welcome"               : "showWelcome"

  showWelcome: ->
    @WelcomeView = new Motherlode.Views.WelcomeView()
