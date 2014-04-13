'use strict'

describe 'Service: BookshelfAPI', ->

  # load the service's module
  beforeEach module 'bookshelfApp'

  # instantiate service
  BookshelfAPI = {}
  beforeEach inject (_BookshelfAPI_) ->
    BookshelfAPI = _BookshelfAPI_

  it 'should do something', ->
    expect(!!BookshelfAPI).toBe true
