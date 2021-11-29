app.config(function($stateProvider) {

  $stateProvider
    .state('businessManagement', {
      url: "",
      views: {
        "": {
          templateUrl: '/static/ngTemplates/businessManagement.html',
        },
        "menu@businessManagement": {
          templateUrl: '/static/ngTemplates/businessManagement.menu.html',
          // controller: 'businessManagement.menu'
        },
        "@businessManagement": {
          templateUrl: '/static/ngTemplates/businessManagement.dash.html',
          controller: 'businessManagement'
        }
      }
    })

    .state('businessManagement.manageUsers', {
      url: "/manageUsers",
      templateUrl: '/static/ngTemplates/app.HR.manage.users.html',
      controller: 'admin.manageUsers'
    })

    .state('businessManagement.home', {
      url: "/home",
      templateUrl: '/static/ngTemplates/businessManagement.dash.html',
      controller: 'businessManagement'
    })

});


app.controller('businessManagement', function($scope, $users, Flash , $http, $rootScope) {
  $scope.days = 7;


  $scope.refresh_data = function(days){
    $scope.days = days;


  }

   $scope.refresh_data('7');
   //
   // $scope.refresh_data = function(response){
   //   console.log(reponse.data);
   // }
   //

  //  $scope.filter.days = day;
  // $scope.refresh_data();

  // $scope.refresh_data = function(response){




  // main businessManagement tab default page controller

  // $scope.labels = ["January", "February", "March", "April", "May", "June", "July"];
  $scope.series = ['Cash on delivery', 'Total Sales', 'Online Payment' ];
  $scope.backgroundColor = ["",
              "",
              ""]


  // $scope.data = [
  //
  // ];


  $scope.onClick = function(points, evt) {
    console.log(points, evt);
  };
  $scope.options = {
    scales: {
      gridLines: {
          showBorder: false,
          display: false ,
          color: "#FFFFFF"
        },


      yAxes: [{

          id: 'y-axis-1',
          fill: false,
          type: 'line',
          display: true,
          position: 'right'


        },
        {
          id: 'y-axis-2',
          type: 'line',
          display: true,
          position: 'right'


        },
        {
          id: 'y-axis-3',
          type: 'line',
          display: true,
          position: 'right'

        }

      ],
    },
    elements:{
      line:{
        fill:false
      }
    }
}







  // $scope.labelsdoughnut = ["Android", "Web", "Ios", "COD"];
  // $scope.datadoughnut =    [200, 400, 200, 200];

  $scope.options = {

  };

  // $scope.pielebels = ["COD", "Online"];
  // $scope.piedata =  [500,500];

  $scope.options = {};

});






app.controller('businessManagement.menu', function($scope, $users, Flash, $permissions) {
  // main businessManagement tab default page controller

  $scope.apps = [];

  $scope.buildMenu = function(apps) {
    for (var i = 0; i < apps.length; i++) {
      a = apps[i];
      parts = a.name.split('.');
      if (a.module != 3 || a.name.indexOf('app') == -1 || parts.length != 2) {
        continue;
      }
      a.state = a.name.replace('app', 'businessManagement')
      a.dispName = parts[parts.length - 1];
      $scope.apps.push(a);
    }
  }

  as = $permissions.apps();
  if (typeof as.success == 'undefined') {
    $scope.buildMenu(as);
  } else {
    as.success(function(response) {
      $scope.buildMenu(response);
    });
  };
});
