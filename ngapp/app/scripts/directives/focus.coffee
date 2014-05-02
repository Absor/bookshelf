'use strict'

angular.module('bookshelfApp')
  .directive('focus', ->
      restrict: 'A'
      scope:
        target: '=focus'
      link: (scope, element, attrs) ->
        element.on('click', ->
          $(scope.target).focus()
        )
  )