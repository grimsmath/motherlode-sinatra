Motherlode.module 'MotherlodeApp', (App, Motherlode, Backbone, Marionette, $, _) ->
  log arguments

  motherlodeApp =
    run: ->
      log 'MotherlodeApp.run'
      userForm = @getUserForm(@userList)
      categoryForm = @getCategoryForm(@categoryList)
      nuggetForm = @getNuggetForm(@nuggetList)

    getUserForm: (users) ->
      layout = new App.UserForm
        el: $('#content')
        collection: users

      return layout

    getCategoryForm: (categories) ->
      layout = new App.CategoryForm
        el: $('#content')
        collection: categories

      return layout

    getNuggetForm: (nuggets) ->
      layout = new App.NuggetForm
        el: $('#content')
        collection: nuggets

      return layout

  Motherlode.addInitializer ->
    motherlodeApp.run()