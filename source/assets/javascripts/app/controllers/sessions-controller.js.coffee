app.controller "SessionsController", 
["$scope", "$rootScope", "$state", "Session", "Permit",
($scope, $rootScope, $state, Session, Permit) ->
  $scope.permissions = {}

  $scope.checkPermissions = (resource_name) ->
    if $rootScope.current_user
      Permit.all.get(
        {
          resource_name: resource_name
          token: $scope.current_user.token
        }
      , (data) ->
        $scope.permissions[resource_name] = data.permission_code
      , (data) ->
        {}
      )
    else
      $scope.permissions = {}

  $scope.signIn = () ->
    Session.signIn.save(
      {}
    , user: $scope.user
    , (data) ->
      if data.status == 0
        $rootScope.current_user = data.data
        $scope.user = null
      else
        $scope.user.password = null
        $scope.addAlert("warning", "Invalid Username or Password")

    , (data) ->
      $scope.authErrors = data.data['error']
    )

  $scope.signOut = () ->
    #TODO: Destroy token on server side
    $rootScope.current_user = null
    $state.transitionTo("home")

  $rootScope.$watch('current_user', ()->
    $scope.checkPermissions("admin")
    $scope.checkPermissions("users")
  )
]