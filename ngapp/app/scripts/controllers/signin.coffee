'use strict'

angular.module('bookshelfApp')
  .controller 'SignInCtrl', ($scope, BookshelfAPI, $state, Alert) ->
    $scope.user = {}

    $scope.signIn = ->
      if $scope.user.email? and $scope.user.password?
        $scope.error = false
        BookshelfAPI.User.signIn($scope.user)
          .then(
            -> $state.go 'bookshelf.list',
            -> Alert.add('danger', 'Wrong email or password.')
          )
      else
        Alert.add('danger', 'Wrong email or password.')
