@hackmizzou.controller 'HomeCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.owner = 'Drew';
  $scope.sponsors = [];
  $http.get('./sponsors.json').success((data) ->
    $scope.sponsors = data;
  )
]
