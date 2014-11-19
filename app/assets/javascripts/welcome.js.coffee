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

    # Devise requires a CSRF token be included with all requests. The presence of this token
    # guarantees that the current page was meant to make this request.
    # See more: http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf
    jsonObj[$('meta[name=csrf-param]').attr('content')] = $('meta[name=csrf-token]').attr('content')

    $http.post('/api/lunches/submit.json', jsonObj)
      .success (data) ->
        console.log data
        $scope.saved = true
        $timeout((-> $scope.saved = false), 1000)
      .error (data) ->
        console.log data

  $scope.init()
])
