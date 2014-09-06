app.controller "SessionsController", 
["$scope", "$timeout",  "$rootScope", "$cookies", "$cookieStore", "$location", "$state", "$http", "Session",
($scope, $timeout, $rootScope, $cookies, $cookieStore, $location, $state, $http, Session) -> 
  $scope.signIn = () ->
    Session.signIn.save(
      {}
    , user: $scope.user
    , (data) ->
      if data.status == 0
        $rootScope.current_user = data.data
        $scope.user = null
      else
        $scope.user.password = null
        $scope.addAlert("warning", "Invalid Username or Password")

    , (data) ->
      $scope.authErrors = data.data['error']
    )

  $scope.signOut = () ->
    $rootScope.current_user = null
    #TODO: Destroy token on server side
]