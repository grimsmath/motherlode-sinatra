@Motherlode.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->
  log arguments

  List.User = Marionette.ItemView.extend
    template: 'users/list/templates/user'
    tagName: 'tr'

    initialize: ->
      log 'List.User::initialize'

  List.Users = Marionette.CompositeView.extend
    template: 'users/list/templates/users'
    itemView: List.User
    itemViewContainer: 'tbody'

    initialize: ->
      log 'List.Users::initialize'
