'use strict'

angular.module('bookshelfApp')
  .controller 'BookshelfCtrl', ($scope, BookshelfAPI, $state, Alert) ->
    BookshelfAPI.Bookshelf.findAll().then(
      (data) -> $scope.bookshelves = data
      (error) -> $scope.bookshelves = []
    )

    $scope.addShelf = ->
      BookshelfAPI.Bookshelf.create({name: null}).then(
        (data) ->
          $scope.bookshelves.unshift data
          Alert.add('success', 'Bookshelf added.')
        (error) -> Alert.add('danger', 'Could not add bookshelf.')
      )

    $scope.deleteShelf = (id) ->
      BookshelfAPI.Bookshelf.destroy(id).then(
        (data) ->
          _.remove($scope.bookshelves, (shelf) -> shelf.id == id)
          $state.go('bookshelf.list') if $state.includes('bookshelf.show')
          Alert.add('success', 'Bookshelf deleted.')
        (error) -> Alert.add('danger', 'Could not delete bookshelf.')
      )

    $scope.clearShelf = (id) ->
      BookshelfAPI.Bookshelf.clear(id).then(
        (data) ->
          _.find($scope.bookshelves, (bookshelf) -> bookshelf.id == id).books = []
          Alert.add('success', 'Bookshelf cleared.')
        (error) -> Alert.add('danger', 'Could not clear bookshelf.')
      )

    $scope.editName = (bookshelf) ->
      $scope.editing = bookshelf
      bookshelf.editName = bookshelf.name

    $scope.saveName = (bookshelf) ->
      $scope.editing = null
      bookshelf.oldName = bookshelf.name
      bookshelf.name = bookshelf.editName
      BookshelfAPI.Bookshelf.update(bookshelf.id, {name: bookshelf.editName}).then(
        (data) -> Alert.add('success', 'Bookshelf updated.')
        (error) ->
          bookshelf.name = bookshelf.oldName
          Alert.add('danger', 'Could not update bookshelf.')
      )