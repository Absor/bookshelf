'use strict'

angular.module('bookshelfApp')
  .factory 'Bookshelf', ($http) ->
    Session =
      create: (user) ->
        $http.post('/api/sessions', {email: user.email, password: user.password})

    {
      Session: Session
    }
