app = angular.module 'controllers', []

app.controller('HeaderCtrl', ['$scope', ($scope) ->
  $scope.isAuthenticated = false
])

app.controller('IndexCtrl', ['$scope', ($scope) ->
  testFilm =
    title: 'Rage (Tokarev)'
    year: 2014
    length: 94
    director: 'Paco Cabezas'
    description: 'Cuando un criminal reformado sale de la cárcel y descubre que su hija ha sido secuestrada por la mafia rusa, reúne a su antigua banda para vengarse. '

  testFilm2 =
    title: 'Rage (Tokarev)'
    year: 2014
    length: 94
    director: 'Paco Cabezas'
    description: 'Cuando un criminal reformado sale de la cárcel y descubre que su hija ha sido secuestrada por la mafia rusa, reúne a su antigua banda para vengarse. '

  testFilm3 =
    title: 'Rage (Tokarev)'
    year: 2014
    length: 94
    director: 'Paco Cabezas'
    description: 'Cuando un criminal reformado sale de la cárcel y descubre que su hija ha sido secuestrada por la mafia rusa, reúne a su antigua banda para vengarse. '

  testFilm4 =
    title: 'Rage (Tokarev)'
    year: 2014
    length: 94
    director: 'Paco Cabezas'
    description: 'Cuando un criminal reformado sale de la cárcel y descubre que su hija ha sido secuestrada por la mafia rusa, reúne a su antigua banda para vengarse. '

  testFilm5 =
    title: 'Rage (Tokarev)'
    year: 2014
    length: 94
    director: 'Paco Cabezas'
    description: 'Cuando un criminal reformado sale de la cárcel y descubre que su hija ha sido secuestrada por la mafia rusa, reúne a su antigua banda para vengarse. '

  $scope.lastest = [testFilm, testFilm2, testFilm3, testFilm4, testFilm5]
  $scope.top = [testFilm, testFilm2, testFilm3, testFilm4, testFilm5]

])

app.controller('FilmCtrl', ['$scope', '$routeParams', ($scope, $routeParams) ->
  $scope.page = $routeParams.page
])

