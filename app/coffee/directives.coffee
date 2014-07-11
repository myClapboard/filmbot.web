app = angular.module 'directives', []

app.directive 'focusAutocompleteInput', ($timeout) ->
  link: (scope, element, attrs) ->
    element.bind 'click', ->
      $timeout ->
        element.parent().find('input')[0].focus()
