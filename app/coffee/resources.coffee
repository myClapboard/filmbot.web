app = angular.module 'resources', ['ngResource']

app.factory 'Movies', ['$resource', ($resource) ->
  $resource 'http://api.myclapboard.com/movies:format/:id:format2', {},
    query:
      method: 'JSONP',
      params: { callback: 'JSON_CALLBACK', format: '.jsonp' }
      isArray: true
    get:
      method: 'JSONP',
      params: { callback: 'JSON_CALLBACK', format2: '.jsonp' }
]