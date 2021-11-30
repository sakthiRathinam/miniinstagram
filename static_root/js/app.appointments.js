app.config(function($stateProvider) {

  $stateProvider
    .state('prescription.appointments', {
      url: '/appointments',
      templateUrl: '/static/ngTemplates/app.prescription.appointmentmain.html',
      controller: 'prescription.appointments'
    })

});
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
function dateTotime(date){
  if(typeof date == 'object'){
    var starting = date.toLocaleTimeString().split(" ")[0].split(':')[0]+':' +  date.toLocaleTimeString().split(" ")[0].split(':')[1]
    var ending = date.toLocaleTimeString().split(" ")[1]
    return starting + " "+ending
  }else{
    return date
  }
}
app.controller('prescription.appointments', function($scope,$aside, $state, $http, $timeout, $interval,Flash, $uibModal, $users,$rootScope) {
  $scope.pagination = {
    limit:10,
    offset:0,
  }

  $scope.status = ['All','Pending','Accepted','Declined','Completed']
  $scope.selectedClinic = {
    obj:'',
    status:$scope.status[0],
    date:new Date,
    search:'',
  }
  $scope.allAppointments = function(){
    if(typeof $scope.selectedClinic.obj !='object'){
      Flash.create('warning','please select clinic ')
      return;
    }
    var url = '/api/prescription/appointments/?limit=' + $scope.pagination.limit + '&offset=' + $scope.pagination.offset+'&clinic='+$scope.selectedClinic.obj.clinicpk
    if($scope.selectedClinic.status != 'All' ){
      url += '&status='+$scope.selectedClinic.status
    }
    if($scope.selectedClinic.search.length == 0 ){
      url += '&date='+dateToString($scope.selectedClinic.date)
    }
    if($scope.selectedClinic.search.length > 0){
      url +='&search='+$scope.selectedClinic.search
    }

    $http({
      method: 'GET',
      url:url,
    }).
    then(function(response) {
      $scope.appointments = response.data.results
      $scope.resPrev = response.data.previous
      $scope.resNext = response.data.next
      // console.log($scope.products);
    })
  }

  $scope.previous = function() {
    if ($scope.resPrev != null) {
      $scope.pagination.offset-=$scope.pagination.limit

      $scope.allAppointments()
    }
  }

  $scope.next = function() {
    if ($scope.resNext != null) {

      $scope.pagination.offset+=$scope.pagination.limit
      $scope.allAppointments()
    }
  }

  $scope.editAppointments = function(obj) {
    $uibModal.open({
      templateUrl: '/static/ngTemplates/app.appointment.edit.html',
      size: 'md',
      backdrop: false,
      resolve : {
        obj : function() {
          return obj
        },
      },
      controller: function($scope, $uibModalInstance, $rootScope, obj) {
        $scope.objPk = obj
        $scope.close = function() {
          $uibModalInstance.close();
        }
        console.log(obj);
        $scope.contractStatus=['Pending','Accepted','Declined','Completed']

        $scope.form = {
          acceptedtime : "",
          accepteddate:new Date,
          status:$scope.contractStatus[0],

        }

        // if (obj.user != null) {
        //   $http({
        //     method: 'GET',
        //     url: '/api/HR/users/?id='+ obj.user.pk
        //   }).
        //   then(function(response) {
        //     $scope.assignedTechnician = response.data[0]
        //     $scope.index = $rootScope.techniciansList.findIndex(x => x.pk === $scope.assignedTechnician.pk)
        //     $scope.form.user = $rootScope.techniciansList[$scope.index]
        //   })
        // } else {
        //   $scope.form.user = $rootScope.techniciansList[0]
        // }



        $scope.updateAppointmens = function(){
          if($scope.form.accepteddate.length < 1){
            Flash.create('warning',"please enter the accepteddate")
            return;
          }
          if($scope.form.status.length < 1){
            Flash.create('warning',"please enter the accepteddate")
            return;
          }
          if($scope.form.acceptedtime.length < 1){
            Flash.create('warning',"please enter the accepteddate")
            return;
          }
          $scope.form.accepteddate = dateToString($scope.form.accepteddate)
          $http({
            method: 'PATCH',
            url: '/api/prescription/appointments/'+$scope.objPk+'/',
            data: $scope.form
          }).
          then(function(response) {
            if (response.status == 200) {
              Flash.create('info', "updated successfully");
              $uibModalInstance.dismiss();
            } else {
              Flash.create('danger', response.status + ' : ' + response.statusText + ' - ' + 'Error');
            }
          })

        }

      },
    }).result.then(function() {

    }, function() {
      $scope.allAppointments()
    });

  }
  $scope.createAppointment = function(){
  if(typeof $scope.selectedClinic.obj != 'object'){
    Flash.create('warning',"kindly select the clinic")
    return;
  }
  $aside.open({
    templateUrl: '/static/ngTemplates/app.appointment.create.html',
    placement: 'right',
    size: 'md',
    resolve: {
      clinic: function() {
        return $scope.selectedClinic.obj.clinicpk
      },

      // allExams : function() {
      //   return $scope.allExams;
      // }

    },
    controller: function($scope,clinic, $uibModalInstance, $users, $http, Flash, $sce) {
      $scope.currentClinic = clinic
      $scope.resetForm = function(){
        $scope.form = {
          clinic:$scope.currentClinic,
          doctor:'',
          requesteduser:'',
          first_name:'',
          requesteddate:new Date,
          requestedtime:new Date,
          reason:'',
          clinicCreation:'awefweaf',

        }
      }
      $scope.resetForm();
      $scope.userOnSelect = function(){
        console.log("imhereee")
        $scope.form.first_name = $scope.form.requesteduser.name
      }
      $scope.doctorSearch = function(query) {
        return $http.get('/api/prescription/clinicDoctors/?clinic=' + $scope.currentClinic).
        then(function(response) {
          return response.data;
        })
      }
      $scope.userSearch = function(query) {
        return $http.get('/api/profile/userss/?searchusers=' + query).
        then(function(response) {
          return response.data;
        })
      }

      $scope.createApp = function(){
        if($scope.form.doctor.length==0){
          Flash.create('warning',"kindly select the doctor")
          return;
        }
        if($scope.form.requesteduser.length==0){
          Flash.create('warning',"kindly enter the contactno")
          return;
        }
        if($scope.form.first_name.length==0){
          Flash.create('warning',"kindly enter the name")
          return;
        }
        if($scope.form.reason.length==0){
          Flash.create('warning',"kindly enter the reason")
          return;
        }
        if(typeof $scope.form.requesteduser=='object'){
          $scope.form.requesteduser = $scope.form.requesteduser.mobile
        }
        if(typeof $scope.form.doctor=='object'){
          $scope.form.doctor = $scope.form.doctor.doctor.id
        }
        $scope.form.requestedtime = dateTotime($scope.form.requestedtime)
        $scope.form.requesteddate = dateToString($scope.form.requesteddate)
        $http({
          method: 'POST',
          url: '/api/prescription/addAppointment/',
          data: $scope.form
        }).
        then(function(response) {
          if (response.status == 200) {
            Flash.create('info', "created successfully");
            $uibModalInstance.dismiss();
          } else {
            Flash.create('danger', response.data.error + ' : ' + response.statusText + ' - ' + 'Error');
          }
        })

      }

    }
  }).result.then(function () {

  }, function () {
    $scope.getAllNot()
  });

}



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
    url:url,
  }).
  then(function(response) {
    $scope.allData = response.data
    $rootScope.ownedClinics = $scope.allData.allclinics
    if($rootScope.ownedClinics.length > 0){
      $scope.selectedClinic.obj = $rootScope.ownedClinics[0]
      $scope.allAppointments()

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
    $scope.getClinics()
    console.log($scope.userData,"got the data")
    // console.log($scope.products);
  })
}
$scope.getUser();

});
