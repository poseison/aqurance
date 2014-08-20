# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = angular.module("Diabetes", ["ngResource"])
@RaffleCtrl = ($scope) ->
  $scope.displayUpate='fdfdfd'
  $scope.displayDetails='Details'
  
  $scope.displaydeatils = ->
	  $scope.displayDetails='Dfdfgd'
	  $scope.DisplayUpdate='none'
	  
	
	