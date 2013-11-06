Motherlode.Routers.CategoryRouter = Backbone.Router.extend
  routes:
    "categories"            : "listCategories"
    "category/view/:id"     : "showCategory"
    "category/edit/:id"     : "editCategory"

  listCategories: ->
    @CategoriesView = new Motherlode.Views.CategoriesListView()

  showCategory: (id) ->
    @ShowView = new Motherlode.Views.CategoryShowView()

  editCategory: (id) ->
    @EditView = new Motherlode.Views.CategoryEditView()