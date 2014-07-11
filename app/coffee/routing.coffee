app = angular.module 'routing', ['ngRoute', 'ngDialog']

app.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $routeProvider.when '/',
    templateUrl: 'partials/index.tpl.html'
    controller: 'IndexCtrl'
  $routeProvider.when '/film/:filmId',
    template: '&nbsp',
    controller: null,
    resolve:
      data1 : ($q, ngDialog, $rootScope) ->
        $rootScope.closeDialog = ->
          window.history.back()
        dialog = ngDialog.open
          template: 'partials/film.tpl.html'
          controller: 'FilmCtrl'
          scope: $rootScope,
          closeByEscape: false #Disabled due to issues with routing

        $rootScope.$on '$locationChangeSuccess', ->
          dialog.close()

        $q.defer().promise;
  $routeProvider.otherwise({redirectTo:'/404'})
])