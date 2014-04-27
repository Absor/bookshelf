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
        # TODO send to server

    Bookshelf =
      find: (id) ->
        deferred = $q.defer()
        $http.get('/api/bookshelves/' + id, {headers: getAuthHeaders()})
        .success((data) ->
          deferred.resolve(data)
        )
        .error(-> deferred.reject())
        deferred.promise
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
      destroy: (id) ->
        deferred = $q.defer()
        $http.delete('/api/bookshelves/'+id, {headers: getAuthHeaders()})
        .success((data) ->
          deferred.resolve(data)
        )
        .error(-> deferred.reject())
        deferred.promise

    Book =
      search: (searchTerm) ->
        deferred = $q.defer()
        $http.post('/api/books/search', {search: searchTerm}, {headers: getAuthHeaders()})
        .success((data) ->
            deferred.resolve(data)
          )
        .error(-> deferred.reject())
        deferred.promise
      create: (bookshelfId, data) ->
        deferred = $q.defer()
        $http.post('/api/bookshelves/' + bookshelfId + '/books', {book: data}, {headers: getAuthHeaders()})
        .success((data) ->
          deferred.resolve(data)
        )
        .error(-> deferred.reject())
        deferred.promise
      random: ->
        deferred = $q.defer()
        $http.get('/api/books/random')
        .success((data) ->
          deferred.resolve(data)
        )
        .error(-> deferred.reject())
        deferred.promise

    {
      User: User
      Bookshelf: Bookshelf
      Book: Book
    }
