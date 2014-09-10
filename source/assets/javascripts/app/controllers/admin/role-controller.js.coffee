app.controller "RoleController", 
["$scope", "$rootScope", "$state", "Role",
($scope, $rootScope, $state, Role) -> 
  $state.transitionTo("home") if !$scope.current_user

  $scope.create = (role) ->
    Role.save(
      {
        role: role
        token: $scope.current_user.token
      }
    , (data) ->
      if data.status == 0
        $scope.roles.push(data.data)
        $scope.roleForm.$setPristine()
        $scope.role = {}
    , (data) ->
      {}
    )
]