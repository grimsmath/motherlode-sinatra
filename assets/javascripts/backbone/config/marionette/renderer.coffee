do (Marionette) ->
  Marionette.Renderer.render = (template, data) ->
    path = JST["backbone/modules/" + template]
    unless path
      throw "Template #{path} not found!"
    path(data)