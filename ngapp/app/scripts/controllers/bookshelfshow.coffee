'use strict'

angular.module('bookshelfApp')
  .controller 'BookshelfShowCtrl', ($scope, $stateParams, BookshelfAPI) ->
    $scope.bookshelfId = parseInt($stateParams['bookshelfId'])

    $scope.bookshelfIndex = -1

    $scope.bookshelf = ->
      $scope.bookshelfIndex = _.findIndex($scope.bookshelves, (shelf) -> shelf.id == $scope.bookshelfId) if $scope.bookshelfIndex == -1
      return null if $scope.bookshelfIndex == -1
      $scope.bookshelves[$scope.bookshelfIndex]

    $scope.destroyBook = (bookId) ->
      BookshelfAPI.Book.destroy($scope.bookshelfId, bookId).then(
        (data) ->
          _.remove($scope.bookshelf().books, (book) -> book.id == bookId)
          $scope.alert = {type: 'success', msg: 'Book deleted.'}
        (error) -> $scope.alert = {type: 'danger', msg: 'Could not delete book.'}
      )

    $scope.closeAlert = ->
      $scope.alert = null