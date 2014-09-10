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

  $scope.destroy = (index) ->
    User.delete(
      {
        id: $scope.users[index]._id
        token: $scope.current_user.token
      },
    , (data) ->
      if data.status == 0
        $scope.users.splice(index, 1)
    , (data) ->
      {}
    )
]
