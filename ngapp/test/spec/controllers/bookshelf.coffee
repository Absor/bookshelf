'use strict'

describe 'Controller: BookshelfCtrl', ->

  # load the controller's module
  beforeEach module 'bookshelfApp'

  BookshelfCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BookshelfCtrl = $controller 'BookshelfCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    #expect(scope.awesomeThings.length).toBe 3
