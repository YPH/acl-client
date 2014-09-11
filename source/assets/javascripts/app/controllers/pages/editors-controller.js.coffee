app.controller "EditorsController",
["$scope", "$rootScope", "$location", "$state", "User", "Editor",
($scope, $rootScope, $location, $state, User, Editor) ->  
  User.get(
    {}
  , (data) ->
    $scope.users = data.data
  , (data) ->
    {}
  )

  ###
  Editor.get(
    {
      token: $scope.current_user.token
      page_id: page._id
    }
    , (data) ->
        $scope.editors = data.data
    , (data) ->
      {}
  )
  ###

  $scope.assignEditor = (page) ->
    Editor.save(
      {
        token: $scope.current_user.token
        page_id: page._id
        assignee_id: $scope.user_id
      }
    , (data) ->
      if data.status == 0
        $scope.addAlert("success", "Added Successfully")
      else
        $scope.addAlert("warning", "Already Added")
    , (data) ->
      {}
    ) if $scope.current_user
]
