app.controller "UsersController", 
["$scope", "$rootScope", "$location", "$state", "User",
($scope, $rootScope, $location, $state, User) -> 
  $scope.create = () ->
    User.save(
      {
        user: $scope.user
      }
    , (data) ->
      if data.status == 0
        $rootScope.current_user = data.data 
        $state.transitionTo("home")
      else if data.status == -99
        $scope.addAlert("warning", "Username already taken")

    , (data) ->
      {}
    )
]