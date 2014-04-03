'use strict'

describe 'Controller: SigninCtrl', ->

  # load the controller's module
  beforeEach module 'bookshelfApp'

  SigninCtrl = {}
  scope = {}
  $httpBackend = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, _$httpBackend_) ->
    $httpBackend = _$httpBackend_;
    scope = $rootScope.$new()
    SigninCtrl = $controller 'SigninCtrl', {
      $scope: scope
    }

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  it 'calling signin sends a post request with right parameters', ->
    $httpBackend.whenPOST('/api/sessions').respond 'jee'
    $httpBackend.expectPOST '/api/sessions'
    scope.user =
      email: 'e@mail.com',
      password: 'Email1'
    scope.signin()
    $httpBackend.flush()

