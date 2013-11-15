Motherlode.module 'UserList', (UserList, Motherlode, Backbone, Marionette, $, _) ->

  UserList.UserItemView = Marionette.ItemView.extend
    template: JST['backbone/templates/users/list']

    initialize: ->
      _.bindAll(@, 'render')

  UserList.UserListView = Marionette.CollectionView.extend
    itemView: UserList.UserItemView

  userList =
    run: (users) ->
      listView = @getListView(users)
      Motherlode.list.show(listView)

    getListView: (users) ->
      listView = new UserList.UsersListView
        collection: users
      return listView

  Motherlode.vent.on 'app:initialized', (users) ->
    userList.run(users)