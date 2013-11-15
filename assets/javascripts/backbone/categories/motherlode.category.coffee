Motherlode.module 'Categories', (Categories, Motherlode, Backbone, Marionette, $, _) ->
  log arguments

  Categories.Category = Backbone.MongoModel.extend

  Categories.CategoryCollection = Backbone.Collection.extend
    model: Categories.Category

    initialize: ->
      log 'Categories.CategoryCollection::initialize'

  Categories.getAll = ->
    log 'Categories.getAll'
    if not Categories.CategoryList
      Categories.categoryList = new Categories.CategoryCollection
    return Categories.categoryList