'use strict'

angular
  .module('bookshelfApp', [
    'ui.router'
  ])
  .config(($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise "/"

    $stateProvider
      .state('main', {
        url: '/',
        templateUrl: 'views/main.html'
      })
      .state('sign_in', {
        url: '/sign_in',
        templateUrl: 'views/sign_in.html',
        controller: 'SignInCtrl'
      })
      .state('sign_up', {
        url: '/sign_up',
        templateUrl: 'views/sign_up.html',
        controller: 'SignUpCtrl'
      })
      .state('bookshelf', {
        abstract: true,
        url: '/bookshelf',
        template: '<div ui-view></div>',
        controller: 'BookshelfCtrl'
      })
      .state('bookshelf.list', {
        url: '/list',
        templateUrl: 'views/bookshelf.list.html'
      })
  )
  .config ($httpProvider) ->
    $httpProvider.interceptors.push 'BookshelfResponseInterceptor'
