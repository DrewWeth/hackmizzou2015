# app/assets/javascripts/main.js.coffee

# This line is related to our Angular app, not to our
# HomeCtrl specifically. This is basically how we tell
# Angular about the existence of our application.
@hackmizzou = angular.module('hackmizzou', [])


@hackmizzou.controller 'HackMizzouCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.owner = 'Drew';
  $scope.sponsors = [];
  $http.get('./sponsors.json').success((data) ->
    $scope.sponsors = data;
  )
]

@hackmizzou.controller 'email-form', ['$scope', ($scope) ->
  $scope.email = "";
]




#
# # This routing directive tells Angular about the default
# # route for our application. The term "otherwise" here
# # might seem somewhat awkward, but it will make more
# # sense as we add more routes to our application.
# @hackmizzou.config(['$routeProvider', ($routeProvider) ->
#   $routeProvider.
#     otherwise({
#       templateUrl: '../templates/home.html',
#       controller: 'HomeCtrl'
#     })
# ])
