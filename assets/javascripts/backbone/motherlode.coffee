class window.Motherlode
  @Models: {}
  @Collections: {}
  @Views: {}
  @Routers: {}

  sanity: -> true

  constructor: ->
    @initRouters()
    Backbone.history.start()

  initRouters: ->
    Motherlode.Routers.MainRouter = new Motherlode.Routers.MainRouter()
    Motherlode.Routers.CountyRouter = new Motherlode.Routers.CountyRouter()
    Motherlode.Routers.CategoryRouter = new Motherlode.Routers.CategoryRouter()
    Motherlode.Routers.NuggetRouter = new Motherlode.Routers.NuggetRouter()
