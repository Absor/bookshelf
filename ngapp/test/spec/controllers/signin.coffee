'use strict'

describe 'Controller: SignInCtrl', ->

  beforeEach module 'bookshelfApp'

  SignInCtrl = {}
  scope = {}
  $httpBackend = {}

  beforeEach inject ($controller, $rootScope, _$httpBackend_) ->
    $httpBackend = _$httpBackend_;
    scope = $rootScope.$new()
    SignInCtrl = $controller 'SignInCtrl', {
      $scope: scope
    }

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  it 'calling signIn sends a post request with right parameters', ->
    data =
      email: 'e@mail.com',
      password: 'Email1'
    $httpBackend.expectPOST('/api/users/sign_in', data).respond 'jee'
    scope.user = data
    scope.signIn()
    $httpBackend.flush()

