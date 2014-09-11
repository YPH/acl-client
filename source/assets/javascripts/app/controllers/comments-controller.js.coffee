app.controller "CommentsController", 
["$scope", "$rootScope", "$location", "$state", "Comment",
($scope, $rootScope, $location, $state, Comment) -> 
  $scope.init = (page) ->
    Comment.get(
      {
        page_id: page._id
      }
    , (data) ->
      if data.status == 0
        $scope.comments = data.data
    , (data) ->
      {}
    )

  $scope.create = (page) ->
    Comment.save(
      {
        token: if $scope.current_user then $scope.current_user.token else null
        page_id: page._id
        content: $scope.comment_content
      }
    , (data) ->
      if data.status == 0
        $scope.comments.push(data.data)

        $scope.commentsForm.$setPristine()
        $scope.comment_content = null
    , (data) ->
      {}
    )
]