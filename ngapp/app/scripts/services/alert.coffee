'use strict'

angular.module('bookshelfApp')
  .factory 'Alert', ($rootScope) ->
    $rootScope.alerts = []

    alertService = {
      add: (type, msg) ->
        $rootScope.alerts.push({
          type: type
          msg: msg
          close: ->
            alertService.close(this)
        })

      close: (alert) ->
        alertService.closeByIndex($rootScope.alerts.indexOf(alert));

      closeByIndex: (index) ->
        $rootScope.alerts.splice(index, 1)

      clear: ->
        $rootScope.alerts = []
    }