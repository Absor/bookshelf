'use strict'

angular.module('bookshelfApp')
  .controller 'BookshelfShowCtrl', ($scope, $stateParams) ->
    $scope.id = parseInt($stateParams['bookshelfId'])

    $scope.index = -1

    $scope.bookshelf = ->
      $scope.index = _.findIndex($scope.bookshelves, (shelf) -> shelf.id == $scope.id) if $scope.index == -1
      return null if $scope.index == -1
      $scope.bookshelves[$scope.index]