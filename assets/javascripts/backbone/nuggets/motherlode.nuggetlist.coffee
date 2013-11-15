Motherlode.module 'NuggetList', (NuggetList, Motherlode, Backbone, Marionette, $, _) ->

  NuggetList.NuggetItemView = Marionette.ItemView.extend
    template: JST['backbone/templates/nuggets/list']

    initialize: ->
      _.bindAll(@, 'render')

  NuggetList.NuggetListView = Marionette.CollectionView.extend
    itemView: NuggetList.NuggetItemView

  nuggetList =
    run: (nuggets) ->
      listView = @getListView(nuggets)
      Motherlode.list.show(listView)

    getListView: (nuggets) ->
      listView = new NuggetList.UsersListView
        collection: nuggets
      return listView

  Motherlode.vent.on 'app:initialized', (nuggets) ->
    nuggetList.run(nuggets)