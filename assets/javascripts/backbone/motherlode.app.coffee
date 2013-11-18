Motherlode.module 'MotherlodeApp', (App, Motherlode, Backbone, Marionette, $, _) ->
  log arguments
  events:
    'click .nuggets'    : 'showNuggets'
    'click .categories' : 'showCategories'
    'click .users'      : 'showUsers'


  showNuggets: ->
    @

  showCategories: ->
    @

  showUsers: ->
    @

  motherlodeApp =
    run: ->
      log 'MotherlodeApp.run'
      header = @getHeader()
      footer = @getFooter()
      userForm = @getUserForm(@userList)
      categoryForm = @getCategoryForm(@categoryList)
      nuggetForm = @getNuggetForm(@nuggetList)

    getHeader: ->
      layout = new App.Header
        el: $('#header')

      return layout;

    getFooter: ->
      layout = new App.Footer
        el: $('#footer')

      return layout;

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