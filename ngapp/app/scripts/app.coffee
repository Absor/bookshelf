'use strict'

angular
  .module('bookshelfApp', [
    'ui.router'
  ])
  .config(($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise "/main"

    $stateProvider
      .state('main', {
        url: '/',
        templateUrl: 'views/main.html'
      })
      .state('signin', {
        url: '/signin',
        templateUrl: 'views/signin.html',
        controller: 'SigninCtrl'
      })
  )
