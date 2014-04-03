'use strict'

angular.module('bookshelfApp')
  .factory 'Bookshelf', ->
    class Session
      create: (id, password) ->
        alert "jee"

    # Public API here
    {
      Session: Session
    }
