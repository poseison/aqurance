# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$(document).on "ajax:success", "form#sign_up_user",  (e, data, status, xhr) ->   
      if data.success
           alert('Success!')
           window.location = "www.sitepoint.com"
          else
                foo = $("resp")
                wrapper = foo.wrap("<div></div>")
                wrapper.css "border", "10px solid red"
                wrapper.css "padding", "5px"
                inner = $("<p>This paragraph added with jQuery</p>")
                inner.css "color", "blue"
                inner.click ->
                  alert "hello"
                wrapper.append inner