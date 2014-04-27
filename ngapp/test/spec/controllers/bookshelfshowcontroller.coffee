'use strict'

describe 'Controller: BookshelfshowcontrollerCtrl', ->

  # load the controller's module
  beforeEach module 'bookshelfApp'

  BookshelfshowcontrollerCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BookshelfshowcontrollerCtrl = $controller 'BookshelfshowcontrollerCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
