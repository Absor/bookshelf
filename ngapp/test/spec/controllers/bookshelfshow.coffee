'use strict'

describe 'Controller: BookshelfShowCtrl', ->

  # load the controller's module
  beforeEach module 'bookshelfApp'

  BookshelfShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BookshelfShowCtrl = $controller 'BookshelfShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    #expect(scope.awesomeThings.length).toBe 3
