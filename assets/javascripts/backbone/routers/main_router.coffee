Motherlode.Routers.MainRouter = Backbone.Router.extend
  routes:
    "welcome"               : "showWelcome"

    "counties"              : "listCounties"
    "county/view/:id"       : "viewCounty"
    "county/edit/:id"       : "editCounty"

    "categories"            : "listCategories"
    "category/view/:id"     : "viewCategory"
    "category/edit/:id"     : "editCategory"

    "nuggets"               : "listNuggets"
    "nuggets/moderated"     : "listModerated"
    "nuggets/unmoderated"   : "listUnmoderated"
    "nugget/view/:id"       : "viewNugget"
    "nugget/edit/:id"       : "editNugget"
    ""                      : "showWelcome"

  showWelcome: ->
    @view = new Motherlode.Views.WelcomeView()

  listCounties: ->
    @view = new Motherlode.Views.CountiesListView()

  viewCounty: ->
    @view = new Motherlode.Views.CountyShowView()

  editCounty: ->
    @view = new Motherlode.Views.CountyEditView()

  listCategories: ->
    @view = new Motherlode.Views.CategoriesListView()

  viewCategory: ->
    @view = new Motherlode.Views.CategoryShowView()

  editCategory: ->
    @view = new Motherlode.Views.CategoryEditView()

  listNuggets: ->
    @view = new Motherlode.Views.NuggetListView()

  listModerated: ->
    @view = new Motherlode.Views.ModeratedListView()

  listUnmoderated: ->
    @view = new Motherlode.Views.UnmoderatedListView()

  viewNugget: ->
    @view = new Motherlode.Views.NuggetShowView()

  editNugget: ->
    @view = new Motherlode.Views.NuggetEditView()
