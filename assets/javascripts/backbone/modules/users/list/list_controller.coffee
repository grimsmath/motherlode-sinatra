@Motherlode.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->
  log arguments

  List.Controller =

    list: ->
      log "UsersApp.List::list"
      users = App.request "user:entities"
      listView = @getListView users
      App.regionContent.show listView

    getListView: (users) ->
      log "UsersApp.List::getListView"
      new List.Users
        collection: users
