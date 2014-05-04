'use strict'

describe 'Service: Alert', ->

  # load the service's module
  beforeEach module 'bookshelfApp'

  # instantiate service
  Alert = {}
  beforeEach inject (_Alert_) ->
    Alert = _Alert_

  it 'should do something', ->
    #expect(!!Alert).toBe true
