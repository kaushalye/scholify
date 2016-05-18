# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#payments_save").click ->
    console.log('clicked')
    checkedValues =
      $('input:checked').map (x) ->
        this.value
      .get()
    $.ajax({
      type: "POST",
      url: "/multi_payments",
      data: { selectedPayments: checkedValues },
      success:(data) ->
        alert data.id
        return false
      error:(data) ->
        return false
    })