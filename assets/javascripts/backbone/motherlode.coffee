Motherlode = new Backbone.Marionette.Application()

Motherlode.addRegions
  header  : '#header'
  wrapper : '#wrapper'
  content : '#content'
  footer  : '#footer'

window.Motherlode = Motherlode

$(document).ready ->
  log 'document:ready'
  Motherlode.start()