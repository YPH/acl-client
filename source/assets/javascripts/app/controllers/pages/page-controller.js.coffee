app.controller "PageController", 
["$scope", "$rootScope", "$stateParams", "$cookieStore", "$location", "$state", "Page", "Permit",
($scope, $rootScope, $stateParams, $cookieStore, $location, $state, Page, Permit) -> 
  $scope.page = {}

  Page.get(
    {id: $stateParams.id}
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
      Permit.page.get(
        {
          id: $scope.page._id
          token: $scope.current_user.token
        }
      , (data) ->
        $scope.permission = data.permission_code
      , (data) ->
        {}
      ) 

  $scope.canEdit = () ->
    $scope.permission >= Permit.level.write

  $scope.canDestroy = () ->
    $scope.permission >= Permit.level.destroy

  $scope.$watch('page', () ->
    $scope.checkPermission()
  )
  $scope.$watch('current_user', ()->
    $scope.checkPermission()
  )
]