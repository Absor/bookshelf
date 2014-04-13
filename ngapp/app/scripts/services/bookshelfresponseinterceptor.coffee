'use strict'

angular.module('bookshelfApp')
  .factory 'BookshelfResponseInterceptor', ($q, Storage, $injector) ->
    {
      'responseError': (rejection) ->
        # If not signing in and unauthorized -> redirect to main page
        if (not /sign_in$/.test rejection.config.url) and (rejection.status is 401)
          Storage.removeLogin()
          $injector.get('$state').go 'main'
        $q.reject rejection
    }
