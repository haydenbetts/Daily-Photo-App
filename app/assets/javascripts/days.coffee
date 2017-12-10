# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# this makes sure that the dom is loaded...
$ ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      # pass update function to onSelect event handler
      onSelect: @update
      # pass update function to onChange event handler
      onChange: @update

  update: (coords) =>
    $('#day_crop_x').val(coords.x)
    $('#day_crop_y').val(coords.y)
    $('#day_crop_w').val(coords.w)
    $('#day_crop_h').val(coords.h)
