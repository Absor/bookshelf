'use strict'

angular.module('bookshelfApp')
  .controller 'BookshelfCtrl', ($scope, BookshelfAPI, $state) ->
    BookshelfAPI.Bookshelf.findAll().then(
      (data) -> $scope.bookshelves = data
      (error) -> $scope.bookshelves = []
    )

    $scope.addShelf = ->
      BookshelfAPI.Bookshelf.create({name: null}).then(
        (data) ->
          $scope.bookshelves.unshift data
          $scope.alert = {type: 'success', msg: 'Bookshelf added.'}
        (error) -> $scope.alert = {type: 'danger', msg: 'Could not add bookshelf.'}
      )

    $scope.deleteShelf = (id) ->
      BookshelfAPI.Bookshelf.destroy(id).then(
        (data) ->
          _.remove($scope.bookshelves, (shelf) -> shelf.id == id)
          $state.go('bookshelf.list') if $state.includes('bookshelf.show')
          $scope.alert = {type: 'success', msg: 'Bookshelf deleted.'}
        (error) -> $scope.alert = {type: 'danger', msg: 'Could not delete bookshelf.'}
      )

    $scope.closeAlert = ->
      $scope.alert = null

    $scope.clearShelf = (id) ->
      BookshelfAPI.Bookshelf.clear(id).then(
        (data) ->
          _.find($scope.bookshelves, (bookshelf) -> bookshelf.id == id).books = []
          $scope.alert = {type: 'success', msg: 'Bookshelf cleared.'}
        (error) -> $scope.alert = {type: 'danger', msg: 'Could not clear bookshelf.'}
      )

    $scope.editName = (bookshelf) ->
      $scope.editing = bookshelf
      bookshelf.editName = bookshelf.name

    $scope.saveName = (bookshelf) ->
      $scope.editing = null
      bookshelf.oldName = bookshelf.name
      bookshelf.name = bookshelf.editName
      BookshelfAPI.Bookshelf.update(bookshelf.id, {name: bookshelf.editName}).then(
        (data) -> $scope.alert = {type: 'success', msg: 'Bookshelf updated.'}
        (error) ->
          bookshelf.name = bookshelf.oldName
          $scope.alert = {type: 'danger', msg: 'Could not update bookshelf.'}
      )