'use strict'

angular.module('bookshelfApp')
  .controller 'SignUpCtrl', ($scope, BookshelfAPI, Storage, $state, Alert) ->
    $scope.user = {
      password_confirmation: ''
    }
    $scope.errors = {}

    $scope.signUp = ->
      BookshelfAPI.User.create($scope.user).then(
        (data) ->
          Storage.storeLogin data.email, data.token
          $state.go 'bookshelf.list'
        (data) ->
          $scope.errors = data
          Alert.clear()
          _.each($scope.errors, (errors, key) ->
            error = _.first(errors)
            Alert.add('warning', 'Email ' + error + '.') if key == 'email'
            Alert.add('warning', 'Password ' + error + '.') if key == 'password'
            Alert.add('warning', 'Password confirmation ' + error + '.') if key == 'password_confirmation'
          )
      )

    $scope.getError = (field) ->
      errors = $scope.errors[field]
      if errors? then errors[0] else null

    $scope.getClass = (field) ->
      if $scope.getError(field)?
        'has-error'

    $scope.setError = (field) ->
      $scope.errorText = $scope.getError(field)