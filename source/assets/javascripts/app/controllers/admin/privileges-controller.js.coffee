app.controller "PrivilegesController", 
["$scope", "$rootScope", "$state", "Privilege",
($scope, $rootScope, $state, Privilege) -> 
  $scope.privileges = []

  $scope.privilege_levels = [
    { code: 1, name: 'R' },
    { code: 2, name: 'R/W' },
    { code: 4, name: 'R/W/D' }
  ]

  $scope.privilege_name = (code) ->
    _.findWhere($scope.privilege_levels, { code: code }).name

  $state.transitionTo("home") if !$scope.current_user

  Privilege.get(
    {token: $scope.current_user.token}
  , (data) ->
    if data.status == 0
      $scope.privileges = data.data
  , (data) ->
    {}
  )

  $scope.destroy = (index) ->
    Privilege.delete(
      {
        id: $scope.privileges[index]._id
        token: $scope.current_user.token
      }
    , (data) ->
      if data.status == 0
        $scope.privileges.splice(index, 1)
    , (data) ->
      {}
    )
]