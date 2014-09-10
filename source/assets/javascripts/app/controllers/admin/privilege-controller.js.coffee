app.controller "PrivilegeController", 
["$scope", "$rootScope", "$state", "Privilege",
($scope, $rootScope, $state, Privilege) -> 
  $scope.create = (privilege) ->
    Privilege.save(
      {
        privilege: privilege
        token: $scope.current_user.token
      }
    , (data) ->
      if data.status == 0
        $scope.privileges.push(data.data)
        $scope.privilegeForm.$setPristine()
        $scope.privilege = {}
    , (data) ->
      {}
    )
]