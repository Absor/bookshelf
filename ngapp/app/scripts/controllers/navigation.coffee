'use strict'

angular.module('bookshelfApp')
  .controller 'NavigationCtrl', ($scope, BookshelfAPI, CurrentUser, $state) ->
    $scope.user = CurrentUser
    $scope.signOut = ->
      BookshelfAPI.User.signOut().then(
        (data) -> $state.go 'main'
        (error) -> console.log("Error: could not sign out.")
      )