app.config(function($stateProvider){

  $stateProvider
  .state('businessManagement.configuration', {
    url: "/configuration",
    templateUrl: '/static/ngTemplates/app.configure.html',
    controller: 'businessManagement.configure',
  })

});

app.controller("businessManagement.configure", function($scope, $state, $users, $stateParams, $http, Flash, $uibModal, $rootScope, $aside) {





})
