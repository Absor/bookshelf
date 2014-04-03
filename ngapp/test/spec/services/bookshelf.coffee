'use strict'

describe 'Service: Bookshelf', ->

  # load the service's module
  beforeEach module 'bookshelfApp'

  # instantiate service
  Bookshelf = {}
  beforeEach inject (_Bookshelf_) ->
    Bookshelf = _Bookshelf_

  it 'should do something', ->
    expect(!!Bookshelf).toBe true
