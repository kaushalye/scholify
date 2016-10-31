# app/views/listings/submit_sponsor.js.coffee
  
$("#donation_scholarship_id").empty()
  .append("<%= escape_javascript(render(:partial => @scholarships)) %>")