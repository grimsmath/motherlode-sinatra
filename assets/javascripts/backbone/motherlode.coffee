Motherlode = new Backbone.Marionette.Application()

Motherlode.addRegions
  header  : '#header'
  wrapper : '#wrapper'
  content : '#content'
  nav     : '#nav'
  footer  : '#footer'

window.Motherlode = Motherlode

$(document).ready ->
  log 'document:ready'
  @logger = new Logger()
  Motherlode.start()