'use strict'

angular.module('bookshelfApp')
  .factory 'BookshelfAPI', ($http, $q, Storage, CurrentUser) ->

    getAuthHeaders = ->
      {email: CurrentUser.encryptedEmail, token: CurrentUser.token}

    User =
      signIn: (user) ->
        deferred = $q.defer()
        $http.post('/api/users/sign_in', user)
          .success((data) ->
            Storage.storeLogin data.email, data.token
            deferred.resolve()
          )
          .error(-> deferred.reject())
        deferred.promise

      signOut: ->
        Storage.removeLogin()

    Bookshelf =
      find: (id) ->
        alert 'test'
      findAll: ->
        deferred = $q.defer()
        $http.get('/api/bookshelves', {headers: getAuthHeaders()})
          .success((data) ->
            deferred.resolve(data)
          )
          .error(-> deferred.reject())
        deferred.promise
      create: (data) ->
        deferred = $q.defer()
        $http.post('/api/bookshelves', data, {headers: getAuthHeaders()})
        .success((data) ->
            deferred.resolve(data)
          )
        .error(-> deferred.reject())
        deferred.promise

    {
      User: User,
      Bookshelf: Bookshelf
    }
