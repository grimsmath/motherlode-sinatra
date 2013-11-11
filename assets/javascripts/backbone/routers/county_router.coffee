Motherlode.Routers.CountyRouter = Backbone.Router.extend
  routes:
    "counties"              : "listCounties"
    "county/view/:id"       : "viewCounty"
    "county/edit/:id"       : "editCounty"

  listCounties: ->
    @Countiesview = new Motherlode.Views.CountiesListView()

  showCounty: (id) ->
    @ShowView = new Motherlode.Views.CountyShowView()

  editCounty: (id) ->
    @EditView = new Motherlode.Views.CountyEditView()