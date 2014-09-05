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
        $scope.user = null
      else
        #Wrong Sign In Info
        $scope.user.password = null

    , (data) ->
      $scope.authErrors = data.data['error']
    )

  $scope.signOut = () ->
    $rootScope.current_user = null
    #TODO: Destroy token on server side
]