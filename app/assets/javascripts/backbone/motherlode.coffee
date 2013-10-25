class window.Motherlode
  sanity: -> true

  constructor: ->
    new Motherlode.Router()
    Backbone.history.start()

