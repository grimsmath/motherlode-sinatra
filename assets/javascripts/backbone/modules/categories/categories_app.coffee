Motherlode.module 'Categories', (Categories, Motherlode, Backbone, Marionette, $, _) ->
  log arguments

  Categories.Category = Backbone.MongoModel.extend

  Categories.CategoryCollection = Backbone.Collection.extend
    model: Categories.Category

    initialize: ->
      log 'Categories.CategoryCollection::initialize'