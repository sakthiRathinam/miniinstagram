app.config(function($stateProvider) {

  $stateProvider
    .state('prescription', {
      url: "/home",
      views: {
        "": {
          templateUrl: '/static/ngTemplates/organization.html',
        },
        "menu@prescription": {
          templateUrl: '/static/ngTemplates/organization.menu.html',
        },
        // "@prescription": {
        //   templateUrl: '/static/ngTemplates/organization.html',
        //   controller: 'organization.dash'
        // }
      }
    })

    .state('prescription.manageUsers', {
      url: "/manageUsers",
      templateUrl: '/static/ngTemplates/app.HR.manage.users.html',
      controller: 'admin.manageUsers.institutes'
    })

    .state('prescription.all', {
      url: "/alUsers/:id",
      templateUrl: '/static/ngTemplates/app.HR.manage.users.all.html',
      controller: 'admin.manageUsers'
    })


    .state('prescription.newUser', {
      url: "/newUser",
      templateUrl: '/static/ngTemplates/app.HR.form.newUser.html',
      controller: 'admin.manageUsers.userform'
    })

    .state('prescription.editUser', {
      url: "/editUser/:id",
      templateUrl: '/static/ngTemplates/app.HR.form.newUser.html',
      controller: 'admin.manageUsers.userform'
    })

});

app.controller('organization.dash', function($scope, $state, $http, $timeout, $interval,Flash, $uibModal, $users) {
  $state.go('prescription.management');
});
