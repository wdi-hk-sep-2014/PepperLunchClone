# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App = angular.module("myApp", [])

App.controller("TimetableCtrl",["$scope", ($scope) ->
  $scope.lunchCount = 0
  $scope.increment = ->
    $scope.lunchCount++
  ])

