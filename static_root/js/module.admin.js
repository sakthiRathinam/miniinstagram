app.config(function($stateProvider){

  $stateProvider
  .state('admin', {
    url: "/admin",
    views: {
       "": {
          templateUrl: '/static/ngTemplates/admin.html',
       },
       "menu@admin": {
          templateUrl: '/static/ngTemplates/admin.menu.html',
          controller : 'admin.menu'
        },
        "@admin": {
          templateUrl: '/static/ngTemplates/admin.dash.html',
          controller : 'admin'
        }
    }
  })

  



});

app.controller('admin' , function($scope , $users , Flash){
  // main admin tab default page controller
});

app.controller('admin.menu' , function($scope , $users , Flash , $permissions){
  // main admin tab default page controller

  $scope.apps = [];

  $scope.buildMenu = function(apps){
    for (var i = 0; i < apps.length; i++) {
      a = apps[i];
      parts = a.name.split('.');
      // if (a.module != 2 || a.name.indexOf('sudo') == -1 || parts.length > 2) {
      //   continue;
      // }
      a.state = a.name.replace('sudo' , 'admin')
      a.dispName = parts[parts.length -1];
      $scope.apps.push(a);
    }
  }

  as = $permissions.apps();
  if(typeof as.success == 'undefined'){
    $scope.buildMenu(as);
  } else {
    as.success(function(response){
      $scope.buildMenu(response);
    });
  };
});
