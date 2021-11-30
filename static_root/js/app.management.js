app.config(function($stateProvider) {

  $stateProvider
    .state('prescription.management', {
      url: '/management',
      templateUrl: '/static/ngTemplates/app.prescription.management.html',
      controller: 'prescription.management'
    })



});
function dateTotime(date){
  if(typeof date == 'object'){
    var starting = date.toLocaleTimeString().split(" ")[0].split(':')[0]+':' +  date.toLocaleTimeString().split(" ")[0].split(':')[1]
    var ending = date.toLocaleTimeString().split(" ")[1]
    return starting + " "+ending
  }else{
    return date
  }
}
function dateToString(date) {
  if (typeof date == 'object') {
    var day = date.getDate()
    console.log(day)
    var month = date.getMonth() + 1
    var year = date.getFullYear()
    return year + '-' + month + '-' + day
  } else {
    return date
  }
}

app.controller('prescription.management', function($scope, $state, $http, $timeout, $interval,Flash, $uibModal, $users,$rootScope,$aside) {


$scope.name = "management";



$scope.selectedClinic = {
  obj:null,
  companyName:null

}


$scope.mainForm = function(){
  $scope.clinic = {
    displayPicture:null,
    mobile:null,
    gstin:'',
    gstin:'',
    companyName:'',
    address:'',
    pincode:'',
    state:'',
    city:'',
    firstEmergencyContactNo:'',
    secondEmergencyContactNo:'',
    validate_timings:[],

  }
}
$scope.days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
$scope.mainForm();
$scope.arrangeClinic = function(response){
  $scope.clinic = response
  $scope.clinic.sortedTimings = []
  for(var i=0;i<response.sortedTimings;i++){
    $scope.data = {
      startingtime:response.sortedTimings[i][0],
      endingtime:response.sortedTimings[i][1],
      // endingtime:$scope.days[parseInt(response.sortedTimings[i][2])],
    }
    $scope.clinic.sortedTimings.push($scope.data)
}
console.log($scope.clinic.sortedTimings,"imhere")
}

$scope.getSpecificClinic = function(id){
  $http({
    method: 'GET',
    url:  '/api/prescription/getClinicFull/?clinic='+id
  }).
  then(function(response) {
    $scope.clinic = response.data
    $scope.getDoctors()
    $scope.getWorkers()
    // console.log($scope.products);
  })
}
$scope.getDoctors = function(){
  $http({
    method: 'GET',
    url:  '/api/prescription/clinicDoctors/?clinic='+$scope.clinic.id
  }).
  then(function(response) {
    $scope.doctors = response.data

    // console.log($scope.products);
  })
}
$scope.getWorkers = function(){
  $http({
    method: 'GET',
    url:  '/api/prescription/recopinists/?clinic='+$scope.clinic.id
  }).
  then(function(response) {
    $scope.workers = response.data
    $rootScope.currentClinic = $scope.clinic.id
    // console.log($scope.products);
  })
}
$scope.clinics = ["feawaewf","awefeawfaew","awefaewfawef",]
$scope.getClinics = function() {
  var url = '/api/prescription/getDoctorClinics/'
  if($scope.userData.occupation=='MediacalRep'){
    url += '?medicalRepWeb='+$scope.userData.pk
  }
  if($scope.userData.occupation=='Doctor'){

    url += '?doctorWeb='+$scope.userData.pk
  }
  if($scope.userData.occupation=='MedicalRecoptionist'||$scope.userData.occupation=='ClinicRecoptionist'){
    url += '?recoptionistWeb='+$scope.userData.pk
  }
  $http({
    method: 'GET',
    url:  url
  }).
  then(function(response) {
    $scope.allData = response.data
    $rootScope.ownedClinics = $scope.allData.allclinics
    if($rootScope.ownedClinics.length > 0){
      $scope.selectedClinic.obj = $rootScope.ownedClinics[0]
      $scope.getSpecificClinic($scope.selectedClinic.obj.clinicpk)
    }


    // console.log($scope.products);
  })
}
$scope.getUser = function() {
  $http({
    method: 'GET',
    url:  '/api/prescription/getUser/'
  }).
  then(function(response) {
    $scope.userData = response.data
    $rootScope.mainUser = $scope.userData
    console.log($scope.userData,"got the data")
    $scope.getClinics();
    // console.log($scope.products);
  })
}


$scope.getUser();

$scope.addEmployee = function(item) {
    console.log(item);
    $aside.open({
      templateUrl: '/static/ngTemplates/app.employee.create.html',
      size: 'lg',
      backdrop: true,
      placement:'right',
      resolve: {
        clinic: function() {
          return $scope.selectedClinic.obj.clinicpk
        },
        type: function() {
          return item
        },
        // allExams : function() {
        //   return $scope.allExams;
        // }

      },
      controller: 'controller.addEmployee'
    }).result.then(function() {
    }, function() {
        $scope.getSpecificClinic($scope.selectedClinic.obj.clinicpk);
        Flash.create('success',"profile created succesfully or slide closed")

  })
  }
$scope.editEmployee = function(item,user) {
    console.log(item);
    $aside.open({
      templateUrl: '/static/ngTemplates/app.employee.edit.html',
      size: 'lg',
      backdrop: true,
      placement:'right',
      resolve: {
        type: function() {
          return item
        },
        user: function(){
          return user
        },
        // allExams : function() {
        //   return $scope.allExams;
        // }

      },
      controller: 'controller.editEmployee'
    }).result.then(function() {
    }, function() {
        $scope.getSpecificClinic($scope.selectedClinic.obj.clinicpk);
        Flash.create('success',"profile updated succesfully or slide closed")

  })
  }


});
app.controller('controller.editEmployee', function($scope,type,user, $state, $http, $timeout, $interval,Flash, $uibModalInstance,$rootScope) {
  $scope.editUser = user
  $scope.type = type
  $scope.time = {
    mondayTotime:new Date,
    mondayFromtime:new Date,
    tuesdayTotime:new Date,
    tuesdayFromtime:new Date,
    wednesdayTotime:new Date,
    wednesdayFromtime:new Date,
    thursdayTotime:new Date,
    thursdayFromtime:new Date,
    fridayTotime:new Date,
    fridayFromtime:new Date,
    saturdayTotime:new Date,
    saturdayFromtime:new Date,
    sundayTotime:new Date,
    sundayFromtime:new Date,
  }
  $scope.add = function(type){
    if(type=='Monday'){
    var ar = []
    ar.push(dateTotime($scope.time.mondayFromtime))
    ar.push(dateTotime($scope.time.mondayTotime))
    $scope.form.monday.push(ar)
    console.log($scope.form.monday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='tuesday'){
    var ar = []
    ar.push(dateTotime($scope.time.tuesdayFromtime))
    ar.push(dateTotime($scope.time.tuesdayTotime))
    $scope.form.tuesday.push(ar)
    console.log($scope.form.tuesday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='wednesday'){
    var ar = []
    ar.push(dateTotime($scope.time.wednesdayFromtime))
    ar.push(dateTotime($scope.time.wednesdayTotime))
    $scope.form.wednesday.push(ar)
    console.log($scope.form.wednesday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='thursday'){
    var ar = []
    ar.push(dateTotime($scope.time.thursdayFromtime))
    ar.push(dateTotime($scope.time.fridayTotime))
    $scope.form.thursday.push(ar)
    console.log($scope.form.thursday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='friday'){
      var ar = []
      ar.push(dateTotime($scope.time.fridayFromtime))
      ar.push(dateTotime($scope.time.fridayTotime))
    $scope.form.friday.push(ar)
    console.log($scope.form.friday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='saturday'){
    var ar = []
    ar.push(dateTotime($scope.time.saturdayFromtime))
    ar.push(dateTotime($scope.time.saturdayTotime))
    $scope.form.saturday.push(ar)
    console.log($scope.form.saturday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='sunday'){
    var ar = []
    ar.push(dateTotime($scope.time.sundayFromtime))
    ar.push(dateTotime($scope.time.sundayTotime))
    $scope.form.sunday.push(ar)
    console.log($scope.form.sunday,"added")
    Flash.create('info',"added succesfully")
  }

  }
  $scope.deleteTimes = function(type,indx){
    if(type=='monday'){
    $scope.form.monday.splice(indx,1)
    Flash.create('info',"deleted succesfully")
    return;
  }
    if(type=='tuesday'){
      $scope.form.tuesday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }
    if(type=='wednesday'){
      $scope.form.wednesday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }
    if(type=='thursday'){
      $scope.form.thursday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }
    if(type=='friday'){
      $scope.form.friday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }
    if(type=='saturday'){
      $scope.form.saturday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }
    if(type=='sunday'){
      $scope.form.sunday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }

  }

  $scope.resetForm = function(){
    $scope.form = {
      mobile:'',
      first_name:'',
      last_name:'',
      email:'',
      base_fees:'',
      specialization:'',
      dob:new Date,
      blood_group:'',
      clinic:$scope.clinicpk,
      monday:[],
      tuesday:[],
      wednesday:[],
      thursday:[],
      friday:[],
      saturday:[],
      sunday:[],
      fromTimeStr:'',
      toTimeStr:'',
      displayPicture:emptyFile,
      doctor:"afaf",
    }
  }

  $scope.resetForm()
  $scope.assignValues = function(){
    if($scope.type=='doctor'){
      console.log("here")
      $scope.form.monday = $scope.mainUser.clinicShits.Monday[0].timings
      $scope.form.first_name = $scope.mainUser.doctor.first_name
      $scope.form.last_name = $scope.mainUser.doctor.last_name
      $scope.form.email = $scope.mainUser.doctor.email
      $scope.form.mobile = $scope.mainUser.doctor.profile.mobile
      $scope.form.specialization = $scope.mainUser.doctor.profile.specialization
      $scope.form.base_fees = $scope.mainUser.baseFees
      $scope.form.monday = $scope.mainUser.clinicShits.Monday[0].timings
      $scope.form.tuesday = $scope.mainUser.clinicShits.Tuesday[0].timings
      $scope.form.wednesday = $scope.mainUser.clinicShits.Wednesday[0].timings
      $scope.form.thursday = $scope.mainUser.clinicShits.Thursday[0].timings
      $scope.form.friday = $scope.mainUser.clinicShits.Friday[0].timings
      $scope.form.saturday = $scope.mainUser.clinicShits.Saturday[0].timings
      $scope.form.sunday = $scope.mainUser.clinicShits.Sunday[0].timings
      console.log($scope.form,"vlaues assigned")
    }
    if($scope.type=='employee'){
      $scope.form.first_name = $scope.mainUser.user.first_name
      $scope.form.last_name = $scope.mainUser.user.last_name
      $scope.form.email = $scope.mainUser.user.email
      $scope.form.mobile = $scope.mainUser.user.profile.mobile
      $scope.form.fromTimeStr = $scope.mainUser.fromTimeStr
      $scope.form.toTimeStr = $scope.mainUser.toTimeStr
      console.log($scope.form,"vlaues assigned")
    }
  }
  $scope.getProfile = function(){
    let url;
    if($scope.type=='doctor'){
      url = 'api/prescription/clinicDoctors/'+$scope.editUser+'/'
    }
    if($scope.type=='employee'){
      url = 'api/prescription/recopinists/'+$scope.editUser+'/'
    }
    $http({
      method: 'GET',
      url:  url
    }).
    then(function(response) {
      $scope.mainUser = response.data
      $scope.assignValues()
      console.log($scope.mainUser,"got the data")
      // console.log($scope.products);
    })
  }

  $scope.getProfile();
  $scope.updateTimings = function(){
    $scope.dataTosend = {
      pk:$scope.editUser,
      Monday:$scope.form.monday,
      Tuesday:$scope.form.tuesday,
      Wednesday:$scope.form.wednesday,
      Thursday:$scope.form.thursday,
      Friday:$scope.form.friday,
      Saturday:$scope.form.saturday,
      Sunday:$scope.form.sunday,
    }
    $http({
        method: 'POST',
        url: '/api/prescription/timeUpdate/',
        data: $scope.dataTosend,
      }).
      then(function(response) {
        Flash.create('success',"user created succesfully")
        $uibModalInstance.dismiss()
      }, function(err) {
        Flash.create('danger', 'Error while uploading file');
        $scope.uploading = false
      })
  }
  $scope.editProfilee = function(){
    var fd = new FormData()
    fd.append('mobile', $scope.form.mobile)
    fd.append('first_name', $scope.form.first_name)
    fd.append('last_name', $scope.form.last_name)
    fd.append('email', $scope.form.email)
    fd.append('specialization', $scope.form.specialization)
    fd.append('base_fees', $scope.form.base_fees)
    fd.append('doctor', $scope.editUser)
    if ($scope.form.displayPicture != emptyFile && typeof $scope.form.displayPicture != 'string' && $scope.form.displayPicture != null) {
      fd.append('displayPicture', $scope.form.displayPicture)
    }
    $http({
        method: 'POST',
        url: '/api/prescription/editProfile/',
        data: fd,
        transformRequest: angular.identity,
        headers: {
          'Content-Type': undefined
        }
      }).
      then(function(response) {

        Flash.create('success',"profile c succesfully")
        $uibModalInstance.dismiss()
      }, function(err) {
        Flash.create('danger', 'Error while uploading file');
        $scope.uploading = false
      })
  }
  $scope.editEmployee = function(){
    var fd = new FormData()
    fd.append('mobile', $scope.form.mobile)
    fd.append('first_name', $scope.form.first_name)
    fd.append('last_name', $scope.form.last_name)
    fd.append('email', $scope.form.email)
    fd.append('employee', $scope.editUser)
    if ($scope.form.displayPicture != emptyFile && typeof $scope.form.displayPicture != 'string' && $scope.form.displayPicture != null) {
      fd.append('displayPicture', $scope.form.displayPicture)
    }
    if (typeof $scope.form.fromTimeStr == 'object') {
      $scope.form.fromTimeStr = dateTotime($scope.form.fromTimeStr);
    }
    if (typeof $scope.form.toTimeStr == 'object') {
      $scope.form.toTimeStr = dateTotime($scope.form.toTimeStr);
    }
    fd.append('fromTimeStr',$scope.form.fromTimeStr)
    fd.append('toTimeStr',$scope.form.toTimeStr)
    $http({
        method: 'POST',
        url: '/api/prescription/editProfile/',
        data: fd,
        transformRequest: angular.identity,
        headers: {
          'Content-Type': undefined
        }
      }).
      then(function(response) {

        Flash.create('success',"profile c succesfully")
        $uibModalInstance.dismiss()
      }, function(err) {
        Flash.create('danger', 'Error while uploading file');
        $scope.uploading = false
      })
  }



});
app.controller('controller.addEmployee', function(clinic,$scope,type, $state, $http, $timeout, $interval,Flash, $uibModalInstance, $users,$rootScope) {
  $scope.clinicpk = clinic
  $scope.type = type
  $scope.time = {
    mondayTotime:new Date,
    mondayFromtime:new Date,
    tuesdayTotime:new Date,
    tuesdayFromtime:new Date,
    wednesdayTotime:new Date,
    wednesdayFromtime:new Date,
    thursdayTotime:new Date,
    thursdayFromtime:new Date,
    fridayTotime:new Date,
    fridayFromtime:new Date,
    saturdayTotime:new Date,
    saturdayFromtime:new Date,
    sundayTotime:new Date,
    sundayFromtime:new Date,
  }
  $scope.add = function(type){
    if(type=='Monday'){
    var ar = []
    ar.push(dateTotime($scope.time.mondayFromtime))
    ar.push(dateTotime($scope.time.mondayTotime))
    $scope.form.monday.push(ar)
    console.log($scope.form.monday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='tuesday'){
    var ar = []
    ar.push(dateTotime($scope.time.tuesdayFromtime))
    ar.push(dateTotime($scope.time.tuesdayTotime))
    $scope.form.tuesday.push(ar)
    console.log($scope.form.tuesday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='wednesday'){
    var ar = []
    ar.push(dateTotime($scope.time.wednesdayFromtime))
    ar.push(dateTotime($scope.time.wednesdayTotime))
    $scope.form.wednesday.push(ar)
    console.log($scope.form.wednesday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='thursday'){
    var ar = []
    ar.push(dateTotime($scope.time.thursdayFromtime))
    ar.push(dateTotime($scope.time.fridayTotime))
    $scope.form.thursday.push(ar)
    console.log($scope.form.thursday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='friday'){
      var ar = []
      ar.push(dateTotime($scope.time.fridayFromtime))
      ar.push(dateTotime($scope.time.fridayTotime))
    $scope.form.friday.push(ar)
    console.log($scope.form.friday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='saturday'){
    var ar = []
    ar.push(dateTotime($scope.time.saturdayFromtime))
    ar.push(dateTotime($scope.time.saturdayTotime))
    $scope.form.saturday.push(ar)
    console.log($scope.form.saturday,"added")
    Flash.create('info',"added succesfully")
  }
    if(type=='sunday'){
    var ar = []
    ar.push(dateTotime($scope.time.sundayFromtime))
    ar.push(dateTotime($scope.time.sundayTotime))
    $scope.form.sunday.push(ar)
    console.log($scope.form.sunday,"added")
    Flash.create('info',"added succesfully")
  }

  }
  $scope.deleteTimes = function(type,indx){
    if(type=='monday'){
    $scope.form.monday.splice(indx,1)
    Flash.create('info',"deleted succesfully")
    return;
  }
    if(type=='tuesday'){
      $scope.form.tuesday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }
    if(type=='wednesday'){
      $scope.form.wednesday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }
    if(type=='thursday'){
      $scope.form.thursday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }
    if(type=='friday'){
      $scope.form.friday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }
    if(type=='saturday'){
      $scope.form.saturday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }
    if(type=='sunday'){
      $scope.form.sunday.splice(indx,1)
      Flash.create('info',"deleted succesfully")
      return;
  }

  }


  $scope.userSearch = function(query) {
    return $http.get('/api/profile/userss/?role=Doctor&search=' + query).
    then(function(response) {
      return response.data;
    })
  }
  $scope.resetForm = function(){
    $scope.form = {
      mobile:'',
      first_name:'',
      last_name:'',
      email:'',
      base_fees:'',
      specialization:'',
      dob:new Date,
      blood_group:'',
      clinic:$scope.clinicpk,
      monday:[],
      tuesday:[],
      wednesday:[],
      thursday:[],
      friday:[],
      saturday:[],
      sunday:[],
      fromTimeStr:new Date,
      toTimeStr:new Date,
      displayPicture:emptyFile,
      doctor:"afaf",
    }
  }
  $scope.resetForm();
  $scope.userOnSelect = function(){
    console.log('onselect')
    console.log($scope.form.mobile)
    $scope.form.first_name = $scope.form.mobile.name
    $scope.form.email = $scope.form.mobile.email
    $scope.form.specialization = $scope.form.mobile.specialization;
    $scope.form.blood_group = $scope.form.mobile.blood_group;
  }
  $scope.updateTimings = function(data){
    console.log(data)
    $scope.dataTosend = {
      pk:data,
      Monday:$scope.form.monday,
      Tuesday:$scope.form.tuesday,
      Wednesday:$scope.form.wednesday,
      Thursday:$scope.form.thursday,
      Friday:$scope.form.friday,
      Saturday:$scope.form.saturday,
      Sunday:$scope.form.sunday,
    }
    $http({
        method: 'POST',
        url: '/api/prescription/timeUpdate/',
        data: $scope.dataTosend,
      }).
      then(function(response) {
        Flash.create('success',"user created succesfully")
        $uibModalInstance.dismiss()
      }, function(err) {
        Flash.create('danger', 'Error while uploading file');
        $scope.uploading = false
      })
  }
  $scope.postProfile = function(){
    var fd = new FormData()
    if ($scope.form.first_name == '' || $scope.form.first_name.length == 0) {
        Flash.create('warning' , 'First Name is required')
        return
      }
      if ($scope.form.email == '' || $scope.form.email.length == 0) {
        Flash.create('warning' , 'Email is required')
        return
      }
      if ($scope.form.mobile == '' || $scope.form.mobile.length == 0) {
        Flash.create('warning' , 'Mobile is required')
        return
      }
      if ($scope.form.password == '' || $scope.form.password.length == 0) {
        Flash.create('warning' , 'Password is required')
        return
      }

      if ($scope.form.blood_group == '' || $scope.form.blood_group.length == 0) {
        Flash.create('warning' , 'base_fees is blood_group')
        return
      }
      if (typeof $scope.form.dob == 'object') {
        $scope.form.dob = dateToString($scope.form.dob)
      }
      if (typeof $scope.form.mobile == 'object') {
        $scope.form.mobile = $scope.form.mobile.mobile
      }
      if ($scope.form.displayPicture != emptyFile && typeof $scope.form.displayPicture != 'string' && $scope.form.displayPicture != null) {
        fd.append('displayPicture', $scope.form.displayPicture)
      }
      if($scope.type=='doctor'){
        fd.append('doctor',"waefefwa")
        if ($scope.form.specialization == '' || $scope.form.specialization.length == 0) {
          Flash.create('warning' , 'specialization is required')
          return
        }
        if ($scope.form.base_fees == '' || $scope.form.base_fees.length == 0) {
          Flash.create('warning' , 'base_fees is required')
          return
        }
      }
      if($scope.type=='employee'){
        fd.append('employee',"waefefwa")
        if($scope.form.fromTimeStr.length==0){
          Flash.create('warning',"please enter the from time");
          return;
        }
        if($scope.form.toTimeStr.length==0){
          Flash.create('warning',"please enter the to time");
          return;
        }
        $scope.form.fromTimeStr = dateTotime($scope.form.fromTimeStr);
        $scope.form.toTimeStr = dateTotime($scope.form.toTimeStr);
        fd.append('fromTimeStr', $scope.form.fromTimeStr)
        fd.append('toTimeStr', $scope.form.toTimeStr)

      }
      fd.append('mobile', $scope.form.mobile)
      fd.append('first_name', $scope.form.first_name)
      fd.append('last_name', $scope.form.last_name)
      fd.append('email', $scope.form.email)
      fd.append('password', $scope.form.password)
      fd.append('specialization', $scope.form.specialization)
      fd.append('blood_group', $scope.form.blood_group)
      fd.append('base_fees', $scope.form.base_fees)
      fd.append('mobile', $scope.form.mobile)
      fd.append('dob', $scope.form.dob)
      fd.append('clinic', $scope.form.clinic)
    $http({
        method: 'POST',
        url: '/api/prescription/userCreation/',
        data: fd,
        transformRequest: angular.identity,
        headers: {
          'Content-Type': undefined
        }
      }).
      then(function(response) {
        if($scope.type=='doctor'){
          $scope.updateTimings(response.data.pk)
          return;
        }
        Flash.create('success',"employee created succesfully")
        $uibModalInstance.dismiss()
      }, function(err) {
        Flash.create('danger', 'Error while uploading file');
        $scope.uploading = false
      })
  }

});
