'use strict'

angular.module('bookshelfApp')
  .controller 'MainCtrl', ($scope, BookshelfAPI) ->
    BookshelfAPI.Book.random().then(
      (data) -> $scope.book = data
      (error) -> $scope.book = {}
    )
