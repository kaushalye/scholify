# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  
$(document).ready ->
  $('.rate_calc').change ->
    rate = $('#aud_lkr_rate').val()
    $('#amount_lkr').val($('#amount').val() * rate) if rate > 0
  $('#com_amount_lkr').change ->
    $(".amount-lkr").val($(this).val())
  $('#com_bank_date').change ->
    $(".bank-date").val($(this).val())
  $('#com_effective_year').change ->
    $(".effective-year").val($(this).val())
  $('#com_effective_month').change ->
    $(".effective-month").val($(this).val())
  $('#com_notes').change ->
    $(".notes").val($(this).val())

    
     
