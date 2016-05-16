# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.rate_calc').on 'blur', () ->
    rate = $('#aud_lkr_rate').val()
    $('#amount_lkr').val($('#amount').val() * rate) if rate > 0