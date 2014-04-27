'use strict'

describe 'Controller: BookCtrl', ->

  # load the controller's module
  beforeEach module 'bookshelfApp'

  BookCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BookCtrl = $controller 'BookCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    #expect(scope.awesomeThings.length).toBe 3
