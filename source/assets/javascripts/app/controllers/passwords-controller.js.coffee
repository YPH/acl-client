app.controller "PasswordController", 
["$scope", "$rootScope", "$stateParams", "$location", "$state", "Password",
($scope, $rootScope, $stateParams, $location, $state, Password) -> 
  $state.transitionTo("home") if !$scope.current_user

  $scope.update = () ->
    Password.update(
      {
        id: $stateParams.user_id if $stateParams.user_id
        token: $scope.current_user.token
        password: $scope.password
      },
    , (data) ->
      if data.status == 0
        $scope.addAlert("success", "Update Password Successfully")
      else
        $scope.addAlert("warning", "Fail to Update Password")

      $scope.passwordForm.$setPristine()
      $scope.password = null
    , (data) ->
      {}
    ) if $scope.current_user
]
