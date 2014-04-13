'use strict'

describe 'Service: CurrentUser', ->

  # load the service's module
  beforeEach module 'bookshelfApp'

  # instantiate service
  CurrentUser = {}
  beforeEach inject (_CurrentUser_) ->
    CurrentUser = _CurrentUser_

  it 'should do something', ->
    expect(!!CurrentUser).toBe true
