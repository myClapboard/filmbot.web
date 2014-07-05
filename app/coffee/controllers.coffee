app = angular.module 'controllers', ['resources']

app.controller('HeaderCtrl', ['$scope', '$location', 'Movies' , ($scope, $location, Movies) ->
  $scope.searchFilms = []
  $scope.dropdownVisible = false
  $scope.searchString = ""

  $scope.updateSearch = (keyCode, searchString)->
    if keyCode is 40
      $scope.selectNextValue()
    else if keyCode is 38
      $scope.selectPreviousValue()
    else if keyCode is 13
      $scope.dropdownVisible = false
      $scope.showFilm($scope.searchFilms[$scope.selectedFilm].id)
    else
      $scope.searchFilms = Movies.query(count: 50, q: searchString)
      $scope.selectedFilm = 0

  $scope.hasFocus = (focus) ->
    if focus then $scope.searchString = ""
    $scope.dropdownVisible = focus

  $scope.isDropdownVisible = ->
    return $scope.dropdownVisible

  $scope.showFilm = (id) ->
    $location.url("/film/#{id}/info")

  $scope.selectPreviousValue = ->
    $scope.selectedFilm = if $scope.selectedFilm > 0 then $scope.selectedFilm - 1 else 0

  $scope.selectNextValue = ->
    $scope.selectedFilm = if $scope.selectedFilm < $scope.searchFilms.length - 1 then $scope.selectedFilm + 1 else $scope.searchFilms.length - 1

  $scope.isAuthenticated = false
])

app.controller('IndexCtrl', ['$scope', 'Movies', ($scope, Movies) ->
  $scope.lastest = Movies.query(count: 50)
  $scope.top = Movies.query(count: 50)

])

app.controller('FilmCtrl', ['$scope', '$routeParams', ($scope, $routeParams) ->
  $scope.page = $routeParams.page
#  $scope.film = Movies.get(id: $routeParams.id)
])

