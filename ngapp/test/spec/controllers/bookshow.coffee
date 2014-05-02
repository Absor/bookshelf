'use strict'

describe 'Controller: BookShowCtrl', ->

  # load the controller's module
  beforeEach module 'bookshelfApp'

  BookShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BookShowCtrl = $controller 'BookShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    #expect(scope.awesomeThings.length).toBe 3
