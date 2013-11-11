Motherlode.Views.WelcomeView = Backbone.View.extend
  template: JST["backbone/templates/main/welcome"]
  el: '#backbone-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.MainCountiesView = Backbone.View.extend
  template: JST["backbone/templates/main/counties"]
  el: '#backbone-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.MainCategoriesView = Backbone.View.extend
  template: JST["backbone/templates/main/categories"]
  el: '#backbone-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @

Motherlode.Views.MainNuggetsView = Backbone.View.extend
  template: JST["backbone/templates/main/categories"]
  el: '#backbone-container'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template)
    @