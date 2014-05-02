'use strict'

describe 'Directive: focus', ->

  # load the directive's module
  beforeEach module 'bookshelfApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<focus></focus>'
    element = $compile(element) scope
    #expect(element.text()).toBe 'this is the focus directive'
