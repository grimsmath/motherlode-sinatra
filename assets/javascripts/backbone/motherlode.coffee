class window.Motherlode
  @Models: {}
  @Collections: {}
  @Views: {}
  @Routers: {}

  sanity: -> true

  constructor: ->
    @Routers.Workspace    = new Motherlode.Routers.Workspace()
    @Routers.Categories   = new Motherlode.Routers.Categories()
    @Routers.Nuggets      = new Motherlode.Routers.Nuggets()
    @Routers.Counties     = new Motherlode.Routers.Counties()

    Backbone.history.start()

