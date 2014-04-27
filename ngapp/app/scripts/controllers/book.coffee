'use strict'

angular.module('bookshelfApp')
  .controller 'BookCtrl', ($scope, $stateParams, BookshelfAPI) ->
    $scope.id = parseInt($stateParams['bookshelfId'])

    $scope.index = -1

    $scope.bookshelf = ->
      $scope.index = _.findIndex($scope.bookshelves, (shelf) -> shelf.id == $scope.id) if $scope.index == -1
      return null if $scope.index == -1
      $scope.bookshelves[$scope.index]

    $scope.search = (searchTerm) ->
      BookshelfAPI.Book.search(searchTerm).then(
        (data) -> $scope.books = data
        (error) -> $scope.alert = {type: 'error', msg: 'Search failed.'}
      )

    $scope.addToBookshelf = (isbn) ->
      button = $("#"+isbn)
      button.button('loading')
      BookshelfAPI.Book.create($scope.id, {isbn: isbn}).then(
        (data) ->
          $scope.bookshelf().books.push data
        (error) -> button.button('reset')
      )

    $scope.isInBookshelf = (isbn) ->
      _.find($scope.bookshelf().books, (book) ->
        book.isbn == isbn
      ) != undefined

    $scope.back = ->
      window.history.back()