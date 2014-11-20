# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

App = angular.module("myApp", [])

App.controller("TimetableCtrl", ["$scope", "$http", "$timeout", ($scope, $http, $timeout) ->
  $scope.lunchCount = 0
  $scope.weeks = []

  $scope.saved = false

  $scope.init = ->
    for i in [1..13]
      $scope.weeks.push [0, 0, 0, 0, 0]

  $scope.updateWeeksFromServer = ->
    $http.get('/api/lunches/data.json')
      .success (data) ->
        $scope.weeks = data.weeks
        $scope.lunchCount = data.lunch_count

  $scope.increment = (week, day) ->
    if $scope.weeks[week][day] is 0
      $scope.lunchCount++
      $scope.weeks[week][day] = 1
    else
      $scope.lunchCount--
      $scope.weeks[week][day] = 0

  $scope.getClass = (day) ->
    if day is 0 then 'btn-success' else 'btn-danger'

  $scope.submitCount = ->
    jsonObj = {"data": $scope.weeks}
    $http.post('/api/lunches/submit.json', jsonObj)
      .success (data) ->
        console.log data
        $scope.saved = true
        $timeout((-> $scope.saved = false), 1000)
      .error (data) ->
        console.log data

  $scope.init()
  $scope.updateWeeksFromServer()
])
