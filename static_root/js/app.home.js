
app.controller("controller.home.main", function($scope , $state) {
  $scope.modules = $scope.$parent.$parent.modules;
  $scope.dashboardAccess = false;
  console.log("sdfsdffasd")
  $scope.homeMenuAccess = false;
  if ($scope.modules != undefined) {
    for (var i = 0; i < $scope.modules.length; i++) {
      if ($scope.modules[i].name == 'home'){
        $scope.dashboardAccess = true;
      }
      if ($scope.modules[i].name.indexOf('home') != -1) {
        $scope.homeMenuAccess = true;
      }
    }
  }

})


app.controller('controller.home.menu' , function($scope ,$state, $http, $permissions){
  $scope.apps = [];

  $scope.buildMenu = function(apps){
    for (var i = 0; i < apps.length; i++) {
      a = apps[i];
      if (a.module != 1) {
        continue;
      }

      parts = a.name.split('.');
      a.dispName = parts[parts.length-1];

      if (a.name == 'app.dashboard') {
        a.state = 'home';
      }else {
        a.state = a.name.replace('app' , 'home');
      }
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




})
