# app/assets/javascripts/main.js.coffee

# This line is related to our Angular app, not to our
# HomeCtrl specifically. This is basically how we tell
# Angular about the existence of our application.
@hackmizzou = angular.module('hackmizzou', ['timer'])


@hackmizzou.controller 'HackMizzouCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.owner = 'Drew';
  $scope.sponsors = [];
  $http.get('./sponsors.json').success((data) ->
    $scope.sponsors = data;
  )
]

@hackmizzou.controller 'layoutCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.applyAlert = () ->
    console.log("Apply!");
    swal({title: "Hey, thanks!", text: "Please add your email to the mailing list and we'll make sure to let you know when you can apply!", type:"info", confirmButtonText: "Okay", allowOutsideClick: true, confirmButtonColor: "#F1B82D"});

  $scope.sponsorAlert = () ->
    console.log("Alert");
    swal({title: "", text: "Thanks for wanting to support Hack Mizzou. Please subscribe to the email list and select 'Sponsor' and we'll be in contact!", type:"info", confirmButtonText: "Okay", allowOutsideClick: true, confirmButtonColor: "#F1B82D"});

]



@hackmizzou.controller 'IntroCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.user = {};

  $scope.timerRunning = true;

  $scope.startTimer = ()->
      $scope.$broadcast('timer-start');
      $scope.timerRunning = true;

  $scope.stopTimer = ()->
      $scope.$broadcast('timer-stop');
      $scope.timerRunning = false;

  $scope.$on('timer-stopped', (event, data)->
      console.log('Timer Stopped - data = ', data);
  );

  $scope.resetUser = ()->
    $scope.user = {};
    $scope.user["sponsor"] = false
  $scope.submitUser = (user) ->
    if !$scope.emailForm.email.$pristine && $scope.emailForm.email != null && $scope.emailForm.$valid
      url = './email_lists' + '?email=' + $scope.user.email + "&sponsor=" + $scope.user.sponsor
      console.log("Url is: " + url);
      $http.post(url, message: {email: $scope.user.email}).success(()->
        swal({title: "Thanks " + $scope.user.email + "!", text: "We'll let you know more when things develop!", type:"success", confirmButtonText: "Okay", allowOutsideClick: true, confirmButtonColor: "#F1B82D"});
        $scope.resetUser();

        ).
        error(()->
          swal({title:"Uh oh :(", text: "Saving error.", type: "error", confirmButtonText: "Okay", allowOutsideClick: true, confirmButtonColor: "#F1B82D"});
          );
    else
      swal({title:"Uh oh :(", text: $scope.user.email + " doesn't seem like a valid email.", type: "error", confirmButtonText: "Okay", allowOutsideClick: true, confirmButtonColor: "#F1B82D"});



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
