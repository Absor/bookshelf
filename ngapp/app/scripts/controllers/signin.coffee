'use strict'

angular.module('bookshelfApp')
  .controller 'SignInCtrl', ($scope, BookshelfAPI, $state) ->
    $scope.user = {}
    $scope.error = false

    $scope.signIn = ->
      if $scope.user.email? and $scope.user.password?
        $scope.error = false
        BookshelfAPI.User.signIn($scope.user)
          .then(
            -> $state.go 'main',
            -> $scope.error = true
          )
      else
        $scope.error = true
