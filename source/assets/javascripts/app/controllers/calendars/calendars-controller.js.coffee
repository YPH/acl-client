app.controller "CalendarsController", 
["$scope", "$rootScope", "$state", "Calendar",
($scope, $rootScope, $state, Calendar) -> 
  Calendar.get(
    {token: $scope.current_user.token}
  , (data) ->
    if data.status == 0
      $scope.calendar = data.data
  , (data) ->
    {}
  )
]