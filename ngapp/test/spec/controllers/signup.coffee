'use strict'

describe 'Controller: SignUpCtrl', ->

  # load the controller's module
  beforeEach module 'bookshelfApp'

  SignUpCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SignUpCtrl = $controller 'SignUpCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
