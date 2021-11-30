app.config(function($stateProvider) {

  $stateProvider
    .state('prescription.main', {
      url: '/core',
      templateUrl: '/static/ngTemplates/app.prescription.main.html',
      controller: 'prescription.main'
    })
    .state('prescription.create', {
      url: '/createPrescription/:clinic',
      templateUrl: '/static/ngTemplates/app.prescription.create.html',
      controller: 'prescription.create'
    })
    .state('prescription.view', {
      url: '/view/:clinic/:user/:first',
      templateUrl: '/static/ngTemplates/app.prescription.mainview.html',
      controller: 'prescription.view'
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
app.controller('prescription.view', function($scope, $state, $http, $timeout, $interval,Flash, $uibModal, $users,$rootScope,$aside) {
  $scope.clinic = $state.params.clinic
  $scope.user =  $state.params.user
  $scope.first = $state.params.first

  $scope.pagination = {
    limit:4,
    offset:0,
  }
  $scope.getSpecificPrescription = function(pk){
    let url = '/api/prescription/prescriptions/'+pk+'/'
    $http({
      method: 'GET',
      url:url,
    }).
    then(function(response) {
      $scope.mainPrescription = response.data
      // console.log($scope.products);
    })
  }
  $scope.getSpecificPrescription($scope.first);
  $scope.allAppointments = function(){

    var url = '/api/prescription/prescriptions/?limit=' + $scope.pagination.limit + '&offset=' + $scope.pagination.offset+'&clinic='+$scope.clinic + '&forUser='+$scope.user
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

  $scope.allAppointments();

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
});
app.controller('controller.createAutomated', function($scope, $state,clinic, $http, $timeout, $interval,Flash, $uibModalInstance, $users,$rootScope,prescription,inventory) {
  $scope.clinic = clinic
  $scope.inventory = inventory
  $scope.prescription = prescription
  $scope.resetForm = function(){
    $scope.form = {
      contact_no:'',
      contact_details:'',
      discount:0,
      amount:0,
      date:new Date,
      items:[],
      inventory:$scope.inventory,
      prescription:$scope.prescription,
      clinic:$scope.clinic,
      required_medicines:[],
    }
  }
  $scope.resetForm()
  $scope.getItems = function(){
    var url = '/api/prescription/automatedBill/?inventory=' + $scope.inventory+ '&prescription=' + $scope.prescription
    $http({
      method: 'GET',
      url:url,
    }).
    then(function(response) {
      $scope.form.amount = response.data.amount
      $scope.form.required_medicines = response.data.required
      $scope.form.items = response.data.available

      // console.log($scope.products);
    })
  }
  $scope.getItems();
  $scope.editForm = {
    index:null,
    edited:false,

  }
  $scope.editItem = function(indx){
    $scope.editForm.edited = true
    $scope.editForm.index = indx
    $scope.itemAdd.item = $scope.form.items[indx].item
    $scope.itemAdd.quantity = $scope.form.items[indx].quantity
  }
  $scope.itemResetForm = function(){
    $scope.itemAdd = {
      item:'',
      quantity:0,
      itemprice:0,
    }
  }
  $scope.itemResetForm();

  $scope.addTotal = function(){
    $scope.form.amount = 0
    for(i=0;i<$scope.form.items.length;i++){
      $scope.form.amount += $scope.form.items[i].itemprice
    }
  }
  $scope.medicineSearch = function(query) {
    return $http.get('/api/prescription/subSearch/?name=' + query+'&inventory='+$scope.inventory).
    then(function(response) {
      return response.data;
    })
  }
  $scope.deleteItem = function(index){
    $scope.form.items.splice(index,1)
    $scope.addTotal()
    Flash.create('success','deleted succesfully');
  }
  $scope.additem = function(){

    if(typeof $scope.itemAdd.item!='object'){
      Flash.return('danger','kindly select a item and add it')
      return;
    }
    console.log($scope.itemAdd.item)
    $scope.itemAdd.itemprice = $scope.itemAdd.item.price * $scope.itemAdd.quantity
    if($scope.editForm.edited){
      $scope.form.items[$scope.editForm.index] = $scope.itemAdd
      $scope.editForm.edited = false;
    }else{
      $scope.form.items.push($scope.itemAdd)

    }

    $scope.addTotal();
    $scope.itemResetForm();
  }
  $scope.createBill = function(){
    if($scope.form.contact_no==null||$scope.form.contact_no.length==0){
      Flash.create('danger','kindly enter the contact no ')
      return;
    }
    if($scope.form.contact_details==null||$scope.form.contact_details.length==0){
      Flash.create('danger','kindly enter the from_contact name ')
      return;
    }

    if($scope.form.items.length==0){
      Flash.create('danger','kindly add atleast one medicine')
    }

    if(typeof $scope.form.date=='object'){
      $scope.form.date = dateToString($scope.form.date)
    }
    $http({
      method: 'POST',
      url: '/api/prescription/createBill/',
      data: $scope.form
    }).
    then(function(response) {
      if (response.status == 200) {
        Flash.create('success', "Bill created successfully");
        // $scope.resetForm();
      } else {
        Flash.create('danger', response.status + ' : ' + response.statusText + ' - ' + 'Error');
      }
    })

  }

});
app.controller('prescription.main', function($scope, $state, $http, $timeout, $interval,Flash, $uibModal, $users,$rootScope,$aside) {
  $scope.pagination = {
    limit:10,
    offset:0,
  }
  $scope.sex_types = ['Male','Female','Transgender','Others']

  $scope.stateChange = function(clinic,user,id){
    console.log("im hereeee")
    $state.go('prescription.view',{
      clinic: clinic,
      user:user,
      first:id
    })
  }

  $scope.resetForm = function(){
    $scope.form = {
      forUser:'',
      new_disease:'',
      doctor_fees:'',
      health_issues:'',
      ongoing_treatment:'',
      age:'',
      sex:$scope.sex_types[0],
      clinic:$stateParams.clinic

    }
  }

  $scope.invalid = function(obj){
    if(!obj.active){
      Flash.create('danger','you are not allowed to make it valid once you invalid it')
      return;
    }
    var url = '/api/prescription/prescriptions/' + obj.id +'/'
    $http({
      method: 'PATCH',
      url:url,
      data:{
        active:false,
      }
    }).
    then(function(response) {
      console.log(response.data)
      $scope.allAppointments();
      Flash.create('success','Prescription Changed to Invalid')
      // console.log($scope.products);
    })

  }
  $scope.issued = function(prescription,clinic){
    if(prescription==undefined || clinic==undefined){
      Flash.create('danger','kindly select the clinic')
      return;
    }
    if(!prescription.active){
      Flash.create('danger','This  Prescription is Invalid')
      return;
    }
    $http({
      method: 'POST',
      url:'/api/prescription/issuedPrescription/',
      data:{
        prescription:prescription.id,
        clinic:clinic,
      }
    }).
    then(function(response) {
      Flash.create('suceess',"Issued Succesfully")
      // console.log($scope.products);
    })
  }
  $scope.CreateBill = function(prescription){
    if(typeof $scope.selectedClinic.obj !='object'){
      Flash.create('danger','kindly select the clinic and proceed');
      return;
    }
    if($scope.selectedClinic.obj.inventory==undefined){
      Flash.create('danger','your inventory is not activated create some items in the inventory')
      return;
    }

        $aside.open({
          templateUrl: '/static/ngTemplates/app.createautomatedbill.html',
          size: 'lg',
          backdrop: true,
          placement:'right',
          resolve: {

            inventory: function() {
              return $scope.selectedClinic.obj.inventory
            },
            prescription:function(){
              return prescription
            },
            clinic:function(){
              return $scope.selectedClinic.obj.clinicpk
            },

            // allExams : function() {
            //   return $scope.allExams;
            // }

          },
          controller: 'controller.createAutomated'
        }).result.then(function() {
        }, function() {

      })
      }


  $scope.status = ['All','Pending','Accepted','Declined','Completed']
  $scope.selectedClinic = {
    obj:'',
    status:$scope.status[0],
    search:'',
    date:new Date,
  }
  $scope.changeState = function(){
    if(typeof $scope.selectedClinic.obj == 'object') {
        $state.go('prescription.create', {
          clinic: $scope.selectedClinic.obj.clinicpk
        })
        return;
      }
    Flash.create('warning',"please select a clinic")
    return

    }
  $scope.allAppointments = function(){
    if(typeof $scope.selectedClinic.obj !='object'){
      Flash.create('warning','please select clinic ')
      return;
    }

    var url = '/api/prescription/prescriptions/?limit=' + $scope.pagination.limit + '&offset=' + $scope.pagination.offset

    if( $scope.selectedClinic.obj.type == 'Clinic'){
      url += '&clinic='+$scope.selectedClinic.obj.clinicpk
    }
    if($scope.selectedClinic.search.length == 0 ){
      url += '&date='+dateToString($scope.selectedClinic.date)
    }
    if($scope.selectedClinic.search.length>0){
      url += '&search='+$scope.selectedClinic.search
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
      $scope.allAppointments('d')
    });

  }
  $scope.createAppointment = function(user){
  $aside.open({
    templateUrl: '/static/ngTemplates/app.creeateAppointment.html',
    placement: 'left',
    size: 'lg',
    controller: function($scope, $uibModalInstance, $users, $http, Flash, $sce) {
      $scope.query = "";
      $scope.getAllData = function() {
        $http({
          method: 'GET',
          url: '/api/PIM/notification/?user='+user.pk
        }).
        then(function(response) {
          $scope.notificationsData = response.data;
        })
      }
      $scope.getAllData()

      $scope.saveAsRead = function(index, t) {
        console.log(index, t, 'asdasdasdsda');
        $http({
          method: 'PATCH',
          url: '/api/PIM/notification/'+t.pk+'/',
          data:{'read':true}
        }).
        then(function(response) {
          $scope.notificationsData[index] = response.data;
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
    $scope.ownedClinics = $scope.allData.allclinics
    if($scope.ownedClinics.length > 0){
      $scope.selectedClinic.obj = $scope.ownedClinics[0]
      $scope.allAppointments()

    }



    // console.log($scope.products);
  })
}

$scope.getUser = function() {
  console.log("im here")
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

app.controller('prescription.create', function($scope, $state,$http, $timeout, $interval,Flash, $uibModal, $users,$rootScope) {
  // $scope.dummyForm = {
  //   medicine:"awefwaef",
  //   days:110,
  //   type:'Capsules',
  //   morning_count:110,
  //   afternoon_count:110,
  //   night_count:110,
  //   category:"waefwafe",
  //   command:"awfawedewfawefawefawefweafweafawefaweawfffffff",
  //   fromDate:new Date,
  //   toDate:new Date,
  //   after_food:false,
  //   total_qty:1110,
  // }
  $scope.sex_types = ['Male','Female','Transgender']
  $scope.resetForm = function(){
    $scope.form = {
      usermobile:'',
      clinic:$state.params.clinic,
      username:'',
      age:0,
      health_issues:[],
      age:'',
      ongoing_treatment:'',
      doctor_fees:'',
      sex:$scope.sex_types[0],
      address:'',
      next_visit:new Date,
      medicines:[],
      health:'',
    }
  }

  $scope.resetForm()
  $scope.addPrescription = function(){
    if(typeof $scope.form.usermobile=='object'){
      $scope.form.usermobile = $scope.form.usermobile.mobile
    }
    if($scope.form.usermobile.length==0){
      Flash.create('warning',"please enter the usermobile number")
      return;
    }
    if($scope.form.username.length==0){
      Flash.create('warning',"please enter the username")
      return;
    }
    // if($scope.form.new_disease.length==0){
    //   Flash.create('warning',"please enter the new_disease")
    //   return;
    // }
    // if(typeof $scope.form.new_disease=='object'){
    //   $scope.form.new_disease = $scope.form.new_disease.title
    // }
    if($scope.form.age.length==0){
      Flash.create('warning',"please enter the age")
      return;
    }
    if($scope.form.ongoing_treatment.length==0){
      Flash.create('warning',"please enter the ongoing_treatment")
      return;
    }
    if($scope.form.doctor_fees.length==0){
      Flash.create('warning',"please enter the doctor_fees")
      return;
    }
    if($scope.form.address.length==0){
      Flash.create('warning',"please enter the address")
      return;
    }
    if($scope.form.next_visit.length==0){
      Flash.create('warning',"please enter the next_visit")
      return;
    }
    if($scope.form.medicines.length==0){
      Flash.create('warning',"please enter the medicines")
      return;
    }
    $scope.form.next_visit = dateToString($scope.form.next_visit)
    $http({
      method: 'POST',
      url: '/api/prescription/addPrescription/',
      data: $scope.form
    }).
    then(function(response) {
      if (response.status == 200) {
        Flash.create('success', "updated successfully");
        $scope.resetForm();
      } else {
        Flash.create('danger', response.status + ' : ' + response.statusText + ' - ' + 'Error');
      }
    })


  }
  $scope.deleteIssues = function(index){
    $scope.form.health_issues.splice(index,1)
    Flash.create('success',"deleted succesfully")
  }
  $scope.addIssues = function(index){
    $scope.form.health_issues.push(index)
    Flash.create('success',"added succesfully")
  }

  $scope.userOnSelect = function(query){
    $scope.form.username = $scope.form.usermobile.name
    $scope.form.age = $scope.form.usermobile.age
    $scope.form.health_issues = $scope.form.usermobile.health_issues;
  }

  $scope.userSearch = function(query) {
    return $http.get('/api/profile/userss/?searchusers=' + query).
    then(function(response) {
      return response.data;
    })
  }
  $scope.deleteMedicines = function(index){
    $scope.form.medicines.splice(index,1)
    Flash.create('success',"deleted succesfully");
  }

  $scope.diseaseSearch = function(query) {
    return $http.get('/api/prescription/disease/?search=' + query).
    then(function(response) {
      return response.data;
    })
  }
  $scope.medicineSelect = function(){
    console.log("imselected")
  }
  $scope.addMedicine = function(item,obj,index) {
      console.log(item);
      $uibModal.open({
        templateUrl: '/static/ngTemplates/app.medicine.create.html',
        size: 'lg',
        resolve: {
          course: function() {
            return item
          },
          obj: function() {
            return obj
          },
          index: function() {
            return index
          },
          // allExams : function() {
          //   return $scope.allExams;
          // }

        },
        controller: 'controller.addMedicines'
      }).result.then(function() {
      }, function(data) {
        if(data!="empty"){
          if(item=='edit'){
            $scope.form.medicines[index] = data
            Flash.create('success',"medicine edited succesfully")
            return;
          }
          $scope.form.medicines.push(data)
          Flash.create('success',"medicine added succesfully")
          console.log($scope.medicines,"uimhwaefuhhuawef")
        }

    })
    }



});
app.controller('controller.addMedicines', function($scope,course,obj, $state, $http, $timeout, $interval,Flash, $uibModal, $users,$rootScope,$uibModalInstance) {
  $scope.type = course
  $scope.obj = obj
  $scope.types = ['Liquid','Tablet','Capsules','Cream','Drops','Injections','Inhalers','Suppositories','Others']

  $scope.resetForm = function(){
  $scope.form = {
    medicine:"",
    days:0,
    type:$scope.types[0],
    morning_count:0,
    afternoon_count:0,
    night_count:0,
    category:"",
    command:"",
    fromDate:new Date,
    toDate:new Date,
    after_food:false,
    total_qty:0,
  }
}
  $scope.setForm = function(){
    if($scope.type == 'edit'){
      $scope.resetForm();
      $scope.form = $scope.obj
      return;
    }

    $scope.resetForm();
  }
  $scope.setForm();

  console.log($scope.form)
  $scope.medicineSelect = function(){
    console.log("imselected")
    $scope.form.type = $scope.form.medicine.type
  }

  $scope.addTotal = function(){
    console.log('imheredude');
    $scope.form.total_qty = ($scope.form.days * $scope.form.morning_count) + ($scope.form.days * $scope.form.afternoon_count) + ($scope.form.days * $scope.form.night_count)
  }
  $scope.medicineSearch = function(query) {
    return $http.get('/api/prescription/medicines/?name=' + query).
    then(function(response) {
      return response.data;
    })
  }

  $scope.close = function(){
    $uibModalInstance.dismiss("empty")
  }
  $scope.add = function(){
    if(typeof $scope.form.medicine=='object'){
      $scope.form.medicine = $scope.form.medicine.title
    }

    $uibModalInstance.dismiss($scope.form)
  }

});
