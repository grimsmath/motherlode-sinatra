class window.Motherlode
  @Models: {}
  @Collections: {}
  @Views: {}
  @Routers: {}

  sanity: -> true

  constructor: ->
    @MainRouter = new Motherlode.Routers.MainRouter()
    Backbone.history.start()