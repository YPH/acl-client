app.controller "AdminsController", 
["$scope", "$rootScope", "$state", "Admin",
($scope, $rootScope, $state, Admin) ->
  $state.transitionTo("home") if !$scope.current_user 
  $scope.is_admin = true

  $scope.isAdmin = (user) ->
    Admin.get(
      {
        id: user._id 
        token: $scope.current_user.token
      }
    , (data) ->
      if data.status == 0
        $scope.is_admin = data.is_admin
    , (data) ->
      {}
    )

  $scope.makeAdmin = (user) ->
    Admin.save(
      {
        user_id: user._id 
        token: $scope.current_user.token
      }
    , (data) ->
      if data.status == 0
        $scope.is_admin = true
    , (data) ->
      {}
    )

  $scope.unmakeAdmin = (user) ->
    Admin.delete(
      {
        user_id: user._id 
        token: $scope.current_user.token
      }
    , (data) ->
      if data.status == 0
        $scope.is_admin = false
    , (data) ->
      {}
    )
]