app.controller "RolesController", 
["$scope", "$rootScope", "$state", "Role",
($scope, $rootScope, $state, Role) -> 
  $state.transitionTo("home") if !$scope.current_user

  Role.get(
    {token: $scope.current_user.token}
  , (data) ->
    if data.status == 0
      $scope.roles = data.data
  , (data) ->
    {}
  )
]