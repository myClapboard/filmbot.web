app = angular.module 'resources', ['ngResource']

app.factory 'Movies', ['$resource', ($resource) ->
  $resource 'http://api.myclapboard.com/movies/:id'
]