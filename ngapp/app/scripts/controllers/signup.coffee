'use strict'

angular.module('bookshelfApp')
  .controller 'SignUpCtrl', ($scope, BookshelfAPI, Storage, $state) ->
    $scope.user = {}
    $scope.errors = {}

    $scope.signUp = ->
      console.log($scope.user)
      BookshelfAPI.User.create($scope.user).then(
        (data) ->
          Storage.storeLogin data.email, data.token
          $state.go 'bookshelf.list'
        (error) -> $scope.errors = error
      )

    $scope.getError = (field) ->
      errors = $scope.errors[field]
      if errors? then errors[0] else null

    $scope.getClass = (field) ->
      if $scope.getError(field)?
        'has-error'

    $scope.setError = (field) ->
      $scope.errorText = $scope.getError(field)