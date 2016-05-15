# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
console.log("page load 8989")
$(document).ready ->
  $('.rate_calc').on 'blur', () ->
    $('#amount_lkr').val($('#amount_aud').val() * $('#aud_lkr_rate').val())