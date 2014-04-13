'use strict'

describe 'Service: BookshelfResponseInterceptor', ->

  # load the service's module
  beforeEach module 'bookshelfApp'

  # instantiate service
  BookshelfResponseInterceptor = {}
  beforeEach inject (_BookshelfResponseInterceptor_) ->
    BookshelfResponseInterceptor = _BookshelfResponseInterceptor_

  it 'should do something', ->
    expect(!!BookshelfResponseInterceptor).toBe true
