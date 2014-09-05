app.controller "SessionsController", 
["$scope", "$rootScope", "$cookies", "$cookieStore", "$location", "$state", "$http", "Session",
($scope, $rootScope, $cookies, $cookieStore, $location, $state, $http, Session) -> 
  $scope.signIn = () ->
    Session.signIn.save(
      {}
    , user: $scope.user
    , (data) ->
      if data.status == 0
        $rootScope.current_user = data.data
      else
        #Wrong Sign In Info

    , (data) ->
      $scope.authErrors = data.data['error']
    )
]