'use strict'

angular.module('bookshelfApp')
  .controller 'BookShowCtrl', ($scope, $stateParams, BookshelfAPI) ->
    $scope.bookshelfId = parseInt($stateParams['bookId'])
    BookshelfAPI.Book.find($scope.bookshelfId).then(
      (data) -> $scope.book = data
      (error) ->
        $scope.alert = {type: 'danger', msg: 'Can not get book information.'}
        $scope.book = {}
    )

    $scope.back = ->
      window.history.back()
