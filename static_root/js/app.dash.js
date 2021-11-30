app.config(function($stateProvider) {

  $stateProvider
    .state('prescription.dash', {
      url: '/dash',
      templateUrl: '/static/ngTemplates/app.prescription.dash.html',
      controller: 'prescription.dash'
    })

});

app.controller('prescription.dash', function($scope, $state, $http, $timeout, $interval,Flash, $uibModal, $users) {
$scope.name = "inventory";
});
