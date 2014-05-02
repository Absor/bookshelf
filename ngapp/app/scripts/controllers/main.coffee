'use strict'

angular.module('bookshelfApp')
  .controller 'MainCtrl', ($scope, BookshelfAPI) ->
    BookshelfAPI.Book.random().then(
      (data) ->
        $scope.book = data if data != 'null'
      (error) -> $scope.book = null
    )
