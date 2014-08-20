# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$(document).on "ajax:success", "form#sign_up_user",  (e, data, status, xhr) ->   
      if data.success
           alert('Success!')
           window.location = "/welcome/index"
          else
                alert('failure')