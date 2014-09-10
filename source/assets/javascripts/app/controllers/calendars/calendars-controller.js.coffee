app.controller "CalendarsController", 
["$scope", "$rootScope", "$state", "Calendar",
($scope, $rootScope, $state, Calendar) -> 
  $state.transitionTo("home") if !$scope.current_user
  
  Calendar.get(
    {token: $scope.current_user.token}
  , (data) ->
    if data.status == 0
      $scope.calendar = data.data
  , (data) ->
    {}
  )
]