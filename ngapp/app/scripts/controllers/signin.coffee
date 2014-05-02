'use strict'

angular.module('bookshelfApp')
  .controller 'SignInCtrl', ($scope, BookshelfAPI, $state) ->
    $scope.user = {}

    $scope.signIn = ->
      if $scope.user.email? and $scope.user.password?
        $scope.error = false
        BookshelfAPI.User.signIn($scope.user)
          .then(
            -> $state.go 'main',
            -> $scope.alert = {type: 'danger', msg: 'Wrong email or password.'}
          )
      else
        $scope.alert = {type: 'danger', msg: 'Wrong email or password.'}
