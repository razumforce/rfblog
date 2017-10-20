# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class App.Home
  constructor: () ->
    # initialize some stuff
  render: ->
    "test!"
$ ->
  return unless $(".home.show").length > 0
  f = new App.Home()
  f.render()
