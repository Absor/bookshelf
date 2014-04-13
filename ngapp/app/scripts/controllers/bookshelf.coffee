'use strict'

angular.module('bookshelfApp')
  .controller 'BookshelfCtrl', ($scope, BookshelfAPI) ->
    BookshelfAPI.Bookshelf.findAll().then(
      (data) -> $scope.bookshelves = data
      (error) -> $scope.bookshelves = []
    )

    $scope.addShelf = ->
      BookshelfAPI.Bookshelf.create(null).then(
        (data) -> $scope.bookshelves.push data
        (error) -> alert 'error'
      )