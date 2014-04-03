'use strict'

angular.module('bookshelfApp')
  .controller 'SigninCtrl', ($scope, Bookshelf) ->
    $scope.user = {}
    $scope.error = false

    $scope.signin = ->
      if $scope.user.id? and $scope.user.password?
        $scope.error = false
        Bookshelf.Session.create($scope.user.id, $scope.user.password)
      else
        $scope.error = true
