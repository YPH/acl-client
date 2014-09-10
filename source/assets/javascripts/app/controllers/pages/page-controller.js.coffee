app.controller "PageController", 
["$scope", "$rootScope", "$stateParams", "$cookieStore", "$location", "$state", "Page", "Permit",
($scope, $rootScope, $stateParams, $cookieStore, $location, $state, Page, Permit) -> 
  $state.transitionTo("home") if !$scope.current_user

  $scope.page = {}

  Page.get(
    {
      id: $stateParams.id
      token: $scope.current_user.token
    }
  , (data) ->
    $scope.page = data.data
  , (data) ->
    {}
  ) if $stateParams.id

  $scope.create = () ->
    Page.save(
      {
        token: $scope.current_user.token
        page: $scope.page
      }
    , (data) ->
      if data.status == 0
        $state.transitionTo("home")
    , (data) ->
      {}
    )

  $scope.update = () ->
    Page.update(
      {
        id: $stateParams.id
      },
      {
        token: $scope.current_user.token
        page: $scope.page
      }
    , (data) ->
      if data.status == 0
        $state.transitionTo("page", {id: $stateParams.id})
    , (data) ->
      {}
    )

  $scope.destroy = () ->
    Page.delete(
      {
        id: $stateParams.id
        token: $scope.current_user.token
      },
    , (data) ->
      if data.status == 0
        $state.transitionTo("home")
    , (data) ->
      {}
    )

  $scope.checkPermission = () ->
    if $scope.page && $scope.page._id && $scope.current_user
      Permit.all.get(
        {
          id: $scope.page._id
          resource_name: "Page"
          token: $scope.current_user.token
        }
      , (data) ->
        $scope.permission = data.permission_code
        $scope.updatePrivileges()
      , (data) ->
        {}
      )
    else
      $scope.permission = Permit.level.none
      $scope.updatePrivileges()

  $scope.updatePrivileges = () ->
    $scope.canEdit = $scope.permission >= Permit.level.write
    $scope.canDestroy = $scope.permission >= Permit.level.destroy

  $scope.$watch('page', () ->
    $scope.checkPermission()
  )

  $rootScope.$watch('current_user', ()->
    $scope.checkPermission()
  )
]