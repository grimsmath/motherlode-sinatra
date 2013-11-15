Motherlode.module 'Nuggets', (Nuggets, Motherlode, Backbone, Marionette, $, _) ->
  log arguments

  Nuggets.Nugget = Backbone.MongoModel.extend

  Nuggets.NuggetCollection = Backbone.Collection.extend
    model: Nuggets.Nugget
    url: "/c"

    initialize: ->
      log 'Nuggets.NuggetCollection::initialize'

  Nuggets.getAll = ->
    log 'Nuggets.getAll'

    if not Nuggets.NuggetList
      Nuggets.nuggetList = new Nuggets.NuggetCollection

    return Nuggets.nuggetList