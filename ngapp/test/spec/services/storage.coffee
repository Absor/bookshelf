'use strict'

describe 'Service: Storage', ->

  # load the service's module
  beforeEach module 'bookshelfApp'

  # instantiate service
  Storage = {}
  beforeEach inject (_Storage_) ->
    Storage = _Storage_

  it 'should do something', ->
    expect(!!Storage).toBe true
