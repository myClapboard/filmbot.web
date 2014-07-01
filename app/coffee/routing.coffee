app = angular.module 'routing', ['ngRoute']

app.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $routeProvider.when '/',
    templateUrl: 'partials/index.tpl.html'
    controller: 'IndexCtrl'
  $routeProvider.when '/film/:filmId/:page',
    templateUrl: 'partials/film.tpl.html'
    controller: 'FilmCtrl'
  $routeProvider.otherwise({redirectTo:'/404'})
])