app.controller('sudo.manageUsers.explore', function($scope, $http, $aside, $state, Flash, $users, $filter, $timeout) {

  $scope.data = $scope.tab.data;
  $scope.isStoreGlobal = false;
  $http.get('/api/ERP/appSettings/?app=25&name__iexact=isStoreGlobal').
  then(function(response) {
    if (response.data[0] != null) {
      $scope.isStoreGlobal = response.data[0].flag
    }
  })


  $scope.details = {
    Address: '',
    Company: '',
    GST: '',
    agree: '',
    designation: '',
    email: '',
    emailOTP: '',
    firstName: '',
    lastName: '',
    mobile: '',
    mobileOTP: '',
    password: '',
    pincode: '',
    rePassword: '',
    reg: '',
    statecode: '',
    token: ''
  }

  $scope.addresses = [];
  $http({
    method: 'GET',
    url: '/api/ecommerce/address/?user=' + $scope.data.pk
  }).then(function(response) {
    $scope.addresses = response.data
  })

  // $scope.details = ''
  $scope.updateProfile = false
  if ($scope.data.profile) {
    if ($scope.data.profile.details) {
      $scope.detailsUser = $scope.data.profile.details
      valid = $scope.detailsUser.replace(/u'/g, "'")
      valid = valid.replace(/'/g, '"')
      valid = valid.replace(/True/g, 'true')
      valid = valid.replace(/None/g, '""')
      $scope.details = JSON.parse(valid)
    }

  }
  $scope.updateData = function() {
    $scope.updateProfile = true
  }

  $scope.updateDetails = function() {
    // console.log($scope.details);
    $http({
      method: 'PATCH',
      url: '/api/HR/profile/' + $scope.data.profile.pk + '/',
      data: {
        details: $scope.details,
      }
    }).
    then(function(response) {
      Flash.create('success', 'Saved!')
      $scope.updateProfile = false
    })
  }


});


app.controller('admin.manageUsers.userform', function($scope, $http, $aside, $state, Flash, $users, $filter, $timeout, $uibModal) {

  console.log($scope.tab);
  $scope.roles = []
  $scope.role = null
  $scope.resetForm = function() {
    $scope.data = {
      first_name : "",
      username : "",
      last_name : "",
      password : "",
      mobile : "",
      email : '',
      displayPicture : emptyFile,
      address:'',
      pincode:'',
      state:'',
      city:'',
    }
  }
  $scope.getRoles = function() {
    $scope.roles = []
    $http({
      method: 'GET',
      url: '/api/HR/roles/'
    }).
    then(function(response) {
      $scope.roles = response.data
      if ($scope.roles.length>0&& $scope.data.profile.role!=undefined) {
        for (var i = 0; i < $scope.roles.length; i++) {
          if ($scope.roles[i].pk == $scope.data.profile.role.pk) {
            $scope.role = $scope.roles[i]
          }
        }
      }
    })
  }

  if ($state.is('organization.editUser')) {
    $http({
      method: 'GET',
      url: '/api/HR/users/'+$state.params.id+'/'
    }).
    then(function(response) {
      $scope.data = response.data
      $scope.getRoles()
    })
  }
  else{
    $scope.resetForm()
    $scope.getRoles()
  }




  $scope.createUser = function() {
    if($scope.role==null){
      Flash.create('warning' , 'Select Role Type');
      return
    }
    $scope.data.role = $scope.role.pk
    var method = 'POST';
    var url = '/api/HR/usersAdminMode/'
    if ($scope.data.pk) {
      method = 'PATCH';
      url += $scope.data.pk + '/';
    }
    $http({method : method , url : url , data : $scope.data}).
    then(function(response) {
      Flash.create('success' , 'New User Created');
      $scope.resetForm();
    })
  }

  // if ($scope.tab != null && $scope.tab != undefined) {
  //   var p = $scope.tab.data;
  //
  //   $scope.data = {
  //     pk : p.pk,
  //     first_name : p.first_name,
  //     username : p.username,
  //     last_name : p.last_name,
  //     password : '',
  //     mobile : p.profile.mobile,
  //     email : p.email,
  //     gstin : p.profile.gstin,
  //     companyName : p.profile.companyName,
  //   }
  //   $scope.role = p.profile.role
  //
  // }else{
  //   $scope.resetForm();
  // }



});

app.controller('admin.manageUsers.institutes', function($scope, $http, $aside, $state, Flash, $users, $filter, $timeout, $uibModal) {
$scope.limit = 10
$scope.offset = 0
$scope.search = {
  val : 'ALL',
  query:''
}

$scope.getInstitutes = function() {
  var url = '/api/organization/institute/?limit=' + $scope.limit + '&offset=' + $scope.offset
  if ($scope.search.val == 'SCHOOL') {
      url=url+'&type=SCHOOL'
  }
  if ($scope.search.val == 'COLLEGE') {
      url=url+'&type=COLLEGE'
  }
  if ($scope.search.query.length>0) {
      url=url+'&search='+$scope.search.query
  }
  $http({
      method: 'GET',
      url: url
    })
    .then(function(response) {
      $scope.results = response.data.results
      $scope.total = response.data.count
      $scope.prevData = response.data.previous
      $scope.nextData = response.data.next
    })
}

$scope.getInstitutes()

$scope.pageChanged = function(currentPage) {
  $scope.currentPage = currentPage
  $scope.offset = $scope.limit * ($scope.currentPage - 1)
  $scope.getInstitutes()
};

})



app.controller('admin.manageUsers', function($scope, $http, $aside, $state, Flash, $users, $filter, $timeout, $uibModal) {

  // $scope.openStore = function(indx) {
  //   // console.log(indx, 'jsdjk');
  //   $scope.addTab({
  //     title: 'Edit:' + indx.pk,
  //     cancel: true,
  //     app: 'storeEditor',
  //     data: indx,
  //     active: true
  //   })
  // }
  // $scope.editUserDetails = function(d) {
  //   // console.log(d, 'jsdjk');
  //   $scope.addTab({
  //     title: 'Edit User :' + d.pk,
  //     cancel: true,
  //     app: 'editProfile',
  //     data: d,
  //     active: true
  //   })
  // }
  //
  // $scope.openStoreInfo = function(indx) {
  //   // console.log(indx, 'jsdjk');
  //   $scope.addTab({
  //     title: 'View:' + indx.pk,
  //     cancel: true,
  //     app: 'storeInfo',
  //     data: indx,
  //     active: true
  //   })
  // }
  //
  // $scope.tabs = [];
  // $scope.searchTabActive = true;
  //
  // $scope.closeTab = function(index) {
  //   $scope.tabs.splice(index, 1)
  // }
  //
  // $scope.addTab = function(input) {
  //   // console.log(JSON.stringify(input));
  //   $scope.searchTabActive = false;
  //   alreadyOpen = false;
  //   for (var i = 0; i < $scope.tabs.length; i++) {
  //     if ($scope.tabs[i].data.pk == input.data.pk && $scope.tabs[i].app == input.app) {
  //       $scope.tabs[i].active = true;
  //       alreadyOpen = true;
  //     } else {
  //       $scope.tabs[i].active = false;
  //     }
  //   }
  //   if (!alreadyOpen) {
  //     $scope.tabs.push(input)
  //   }
  // }
  // $scope.form = {
  //   searchValue: '',
  //   sort: '',
  //   page: 0,
  // }
  $scope.limit = 20
  $scope.offset = 0
  // // $scope.next = function() {
  // //   $scope.offset += $scope.limit
  // //   console.log($scope.limit);
  // //   $scope.finalstoreData()
  // // }
  // // $scope.prev = function() {
  // //   if ($scope.limit > 0) {
  // //     $scope.offset -= $scope.limit
  // //
  // //     $scope.finalstoreData()
  // //   }
  // //
  // // }
  // // $scope.searchStore = function() {
  // //   $scope.finalstoreData()
  // // }
  // //
  // // // $scope.sortValue = false
  // // $scope.storeData = []
  // // $scope.finalstoreData = function() {
  // //   var url = '/api/POS/store/?limit=' + $scope.limit + '&offset=' + $scope.offset + '&name__icontains=' + $scope.form.searchValue;
  // //
  // //   // url = url + '&sort=' + $scope.form.sort
  // //   if ($scope.form.sort.length > 0) {
  // //
  // //     if ($scope.form.searchValue.length > 0) {
  // //       url = url + '&sort=' + $scope.form.sort
  // //     } else {
  // //       url = url + '&sort=' + $scope.form.sort
  // //     }
  // //   }
  // //   $http({
  // //     method: 'GET',
  // //     url: url
  // //   }).
  // //   then(function(response) {
  // //     $scope.storeData = response.data.results
  // //
  // //     // console.log(response.data, 'askldfklsad');
  // //   })
  // // }
  // // $scope.finalstoreData()
  // // $scope.Storesorting = function(val) {
  // //   $scope.form.sort = val
  // //   $scope.finalstoreData()
  // // }

  // $scope.userform = {
  //   userText: '',
  //   sort: ''
  // }

  // $scope.Usernext = function() {
  //   $scope.offset += $scope.limit
  //   console.log($scope.limit);
  //   $scope.usersData()
  // }
  // $scope.prevUser = function() {
  //   if ($scope.limit > 0) {
  //     $scope.offset -= $scope.limit
  //
  //     $scope.usersData()
  //   }
  //
  // }

  $scope.allUsers = []
  $scope.search = {
    type:'Sport',
    uploadFile : emptyFile
  }

  $scope.usersData = function() {
    var url = '/api/HR/users/?limit=' + $scope.limit + '&offset=' + $scope.offset+'&profile__institute='+$state.params.id+'&profile__role__title='+$scope.search.type

    $http({
      method: 'GET',
      url: url
    }).
    then(function(response) {
      $scope.allUsers = response.data.results
      $scope.total = response.data.count
      $scope.prevData = response.data.previous
      $scope.nextData = response.data.next
    })
  }

  $scope.pageChanged = function(currentPage) {
    $scope.currentPage = currentPage
    $scope.offset = $scope.limit * ($scope.currentPage - 1)
    $scope.usersData()
  };
  $scope.usersData()
  // $scope.searchUser = function() {
  //   $scope.usersData()
  // }
  // $scope.Usersorting = function(val) {
  //   $scope.userform.sort = '-' + val
  //   console.log($scope.userform.sort);
  //   $scope.usersData()
  // }
$scope.getId = function(indx){
  $scope.selectedIndex = indx
  $scope.selectedUser = $scope.allUsers[indx]
}
  $scope.fileNameChanged = function(files) {
    console.log("FIles : ", files, $scope.selectedUser);
    for (var i = 0; i < files.length; i++) {
      var filedata = files[i]
      // console.log(filedata);
      // console.log($scope.form.media, "05394-");
      // var mediaType = filedata['type'].split('/')[0]
      var fd = new FormData();
      if (filedata != null && filedata != emptyFile) {
        fd.append('displayPicture', filedata)
      }
      $http({
        method: 'PATCH',
        url: '/api/HR/profile/'+$scope.selectedUser.profile.pk+'/',
        data: fd,
        transformRequest: angular.identity,
        headers: {
          'Content-Type': undefined
        }
      }).
      then(function(response) {
        $scope.allUsers[$scope.selectedIndex].profile.displayPicture = response.data.displayPicture
        // Flash.create('success', 'Instutute created successfully!')
        // $scope.form.media.push(response.data)
        // $scope.resetForm()

      })

    }



  }

  $scope.fileUpload = function(files) {

    for (var i = 0; i < files.length; i++) {
      var filedata = files[i]
      var fd = new FormData()
      fd.append('institute', $state.params.id)
      fd.append('type', $scope.search.type)
      fd.append('file', filedata)
      $http({
        method: 'POST',
        url: '/api/organization/userUpload/',
        data: fd,
        transformRequest: angular.identity,
        headers: {
          'Content-Type': undefined
        },
      }).then(function(response) {
        Flash.create("success", `Added count  ${response.data.StudentsAdded}, error count: ${response.data.error}`)
        console.log(response.data)
        $scope.usersData()
      })

    }



  }

$scope.resetForm = function(){
  $scope.form = {
    first_name : '',
    last_name : '',
    mobile:'',
    email:''
  }
}

$scope.resetForm()
  $scope.saveForm = function(){
    var dataToSend = {
      name : $scope.form.first_name,
      regno : $scope.form.last_name,
      mobile : $scope.form.mobile,
      email : $scope.form.email,
      institute : $state.params.id,
      type:$scope.search.type
    }

    $http({
      method: 'POST',
      url: '/api/organization/singleUserUpload/',
      data: dataToSend,
    }).then(function(response) {
      Flash.create("success",'Added new user')
      $scope.resetForm()
      $scope.usersData()
    })
  }
})

app.controller('controller.user.upload', function($scope, $http, $aside, $state, Flash, $users, $filter, $timeout, $uibModal) {

  $scope.bulkForm = {
    xlFile: emptyFile,
    success: false,
    usrCount: 0
  }
  $scope.upload = function() {
    if ($scope.bulkForm.xlFile == emptyFile) {
      Flash.create('warning', 'No file selected')
      return
    }
    $scope.locationData = window.location
    console.log($scope.bulkForm.xlFile);
    var fd = new FormData()
    fd.append('xl', $scope.bulkForm.xlFile);
    fd.append('locationData', $scope.locationData);
    console.log('*************', fd);
    $http({
      method: 'POST',
      url: '/api/HR/bulkUserCreation/',
      data: fd,
      transformRequest: angular.identity,
      headers: {
        'Content-Type': undefined
      }
    }).
    then(function(response) {
      Flash.create('success', 'Created');
      // $scope.bulkForm.usrCount = response.data.count;
      // $scope.bulkForm.success = true;
    })

  }

});
