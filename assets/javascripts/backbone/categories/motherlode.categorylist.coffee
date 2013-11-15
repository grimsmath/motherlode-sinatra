Motherlode.module 'CategoryList', (CategoryList, Motherlode, Backbone, Marionette, $, _) ->

  CategoryList.CategoryItemView = Marionette.ItemView.extend
    template: JST['backbone/templates/categories/list']

    initialize: ->
      _.bindAll(@, 'render')

  CategoryList.CategoryListView = Marionette.CollectionView.extend
    itemView: CategoryList.CategoryListView

  categoryList =
    run: (categories) ->
      listView = @getListView(categories)
      Motherlode.list.show(listView)

    getListView: (categories) ->
      listView = new CategoryList.UsersListView
        collection: categories
      return listView

  Motherlode.vent.on 'app:initialized', (categories) ->
    categoryList.run(categories)