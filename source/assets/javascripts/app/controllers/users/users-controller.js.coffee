app.controller "UsersController", 
["$scope", "$rootScope", "$location", "$state", "User",
($scope, $rootScope, $location, $state, User) -> 
  $state.transitionTo("home") if !$scope.current_user
  
  User.get(
    {
      token: $rootScope.current_user.token
    }
  , (data) ->
    $scope.users = data.data
  , (data) ->
    {}
  )
]