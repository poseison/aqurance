# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$(document).on "ajax:success", "form#sign_up_user",  (e, data, status, xhr) ->   
      if data.success
           alert('Success!')
           window.location = "10.21.32.164:3000/welcome/index"
          else
                alert('failure')