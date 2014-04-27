'use strict'

angular.module('bookshelfApp')
  .controller 'BookshelfCtrl', ($scope, BookshelfAPI) ->
    BookshelfAPI.Bookshelf.findAll().then(
      (data) -> $scope.bookshelves = data
      (error) -> $scope.bookshelves = []
    )

    $scope.addShelf = ->
      BookshelfAPI.Bookshelf.create(null).then(
        (data) -> $scope.bookshelves.unshift data
        (error) -> $scope.alert = {type: 'danger', msg: 'Could not add bookshelf.'}
      )

    $scope.deleteShelf = (id) ->
      BookshelfAPI.Bookshelf.destroy(id).then(
        (data) -> _.remove($scope.bookshelves, (shelf) -> shelf.id == id) # TODO go to list page (when on show page and deleting)
        (error) -> $scope.alert = {type: 'danger', msg: 'Could not delete bookshelf.'}
      )

    $scope.closeAlert = ->
      $scope.alert = null