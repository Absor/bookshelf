'use strict'

angular.module('bookshelfApp')
  .controller 'NavigationCtrl', ($scope, BookshelfAPI, CurrentUser, $state) ->
    $scope.user = CurrentUser
    $scope.signOut = ->
      BookshelfAPI.User.signOut()
      $state.go 'main'