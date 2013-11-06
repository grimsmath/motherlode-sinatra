Motherlode.Routers.NuggetRouter = Backbone.Router.extend
  routes:
    "nuggets"               : "listNuggets"
    "nugget/view/:id"       : "showNugget"
    "nugget/edit/:id"       : "editNugget"

  listNuggets: ->
    @ListView = new Motherlode.Views.NuggetListView()

  showNugget: (id) ->
    @Showview = new Motherlode.Views.NuggetShowView()

  editNugget: (id) ->
    @EditView = new Motherlode.Views.NuggetEditView()
