'use strict'

angular.module('bookshelfApp')
  .factory 'Storage', (CurrentUser) ->

    store = (key, value) ->
      localStorage.setItem key, value

    remove = (key) ->
      localStorage.removeItem key

    get = (key) ->
      localStorage.getItem key

    storeLogin = (email, token) ->
      store 'encryptedEmail', email
      store 'token', token
      CurrentUser.encryptedEmail = email
      CurrentUser.token = token

    removeLogin = ->
      remove 'encryptedEmail'
      remove 'token'
      delete CurrentUser.encryptedEmail
      delete CurrentUser.token


    # Get saved data from storage
    CurrentUser.encryptedEmail = get 'encryptedEmail'
    CurrentUser.token = get 'token'

    {
      store: store
      remove: remove
      get: get
      storeLogin: storeLogin
      removeLogin: removeLogin
    }
