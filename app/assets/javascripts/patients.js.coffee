# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# You can use CoffeeScript in this file: http://coffeescript.org/
$("form#sign_up_user").bind "ajax:success", (e, data, status, xhr) ->
    if data.success
      console.log('Success')
    else
      console.log('failure')
	  
	  
@RaffleCtrl = ($scope, $resource) ->