app.controller "AlertController", 
["$scope", "$timeout", "$rootScope", "$location", "$state", "Page",
($scope, $timeout, $rootScope, $location, $state, Page) -> 
  $scope.alerts = []

  $scope.addAlert = (type, msg) ->
    $scope.alerts.push({
      type: type,
      msg: msg
    })

    $timeout(
      () -> $scope.popAlert(),
      3000
    )

  $scope.popAlert = () ->
    $scope.alerts.pop()

  $scope.closeAlert  = (index) ->
    $scope.alerts.splice(index, 1)
]