app.controller "PagesController", 
["$scope", "$rootScope", "$cookies", "$cookieStore", "$location", "$state", "Page",
($scope, $rootScope, $cookies, $cookieStore, $location, $state, Page) -> 
  Page.get(
    {}
  , (data) ->
    $scope.pages = data.data
  , (data) ->
    {}
  )
]