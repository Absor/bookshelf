'use strict'

angular.module('bookshelfApp')
  .controller 'SigninCtrl', ($scope) ->
    $scope.user = {}

    $scope.signin = ->
      alert "#{$scope.user.id} #{$scope.user.password}"
