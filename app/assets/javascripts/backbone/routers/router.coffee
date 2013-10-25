Motherlode.Router = Backbone.Router.extend
  routes:
    ""                  : "welcome"
    "nuggets"           : "listNuggets"
    "nugget/view/:id"   : "viewNugget"
    "nugget/edit/:id"   : "editNugget"

  welcome: ->
    view = new Motherlode.Views.WelcomeView()
    $('#backbone-container')
      .fadeOut(0)
      .html(view.render().el)
      .fadeIn(500)

  listNuggets: ->
    view = new Motherlode.Views.NuggetListView()
    $('#backbone-container')
      .fadeOut(0)
      .html(view.render().el)
      .fadeIn(500)

  viewNugget: ->
    view = new Motherlode.Views.NuggetShowView()
    $('#backbone-container')
      .fadeOut(0)
      .html(view.render().el)
      .fadeIn(500)

  editNugget: ->
    view = new Motherlode.Views.NuggetEditView()
    $('#backbone-container')
      .fadeOut(0)
      .html(view.render().el)
      .fadeIn(500)