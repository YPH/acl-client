app.controller "ResourceRolesController", 
["$scope", "$rootScope", "$state", "ResourceRole",
($scope, $rootScope, $state, ResourceRole) -> 
  $state.transitionTo("home") if !$scope.current_user

  $scope.role_name = (id) ->
    _.findWhere($scope.roles, { _id: id }).name

  ResourceRole.get(
    {token: $scope.current_user.token}
  , (data) ->
    if data.status == 0
      $scope.resource_roles = data.data
  , (data) ->
    {}
  )

  $scope.destroy = (index) ->
    ResourceRole.delete(
      {
        id: $scope.resource_roles[index]._id
        token: $scope.current_user.token
      }
    , (data) ->
      if data.status == 0
        $scope.resource_roles.splice(index, 1)
    , (data) ->
      {}
    )
]