app.controller "RolesController", 
["$scope", "$rootScope", "$state", "Role",
($scope, $rootScope, $state, Role) -> 
  $state.transitionTo("home") if !$scope.current_user

  $scope.role_name = (id) ->
    _.findWhere($scope.roles, { _id: id }).name

  Role.get(
    {token: $scope.current_user.token}
  , (data) ->
    if data.status == 0
      $scope.roles = data.data
  , (data) ->
    {}
  )

  $scope.destroy = (index) ->
    Role.delete(
      {
        id: $scope.roles[index]._id
        token: $scope.current_user.token
      }
    , (data) ->
      if data.status == 0
        $scope.roles.splice(index, 1)
    , (data) ->
      {}
    )
]