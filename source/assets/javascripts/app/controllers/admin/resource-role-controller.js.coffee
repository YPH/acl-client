app.controller "ResourceRoleController", 
["$scope", "$rootScope", "$state", "ResourceRole",
($scope, $rootScope, $state, ResourceRole) -> 
  $state.transitionTo("home") if !$scope.current_user

  $scope.create = (resource_role) ->
    ResourceRole.save(
      {
        resource_role: resource_role
      }
    , (data) ->
      if data.status == 0
        $scope.resource_roles.push(data.data)
        $scope.resourceroleForm.$setPristine()
        $scope.resource_role = {}
    , (data) ->
      {}
    )
]