app.config(function($stateProvider) {

  $stateProvider
    .state('prescription.inventory', {
      url: '/inventory',
      templateUrl: '/static/ngTemplates/app.prescription.inventory.html',
      controller: 'prescription.inventory'
    })
    .state('prescription.itemview', {
      url: '/category/:id',
      templateUrl: '/static/ngTemplates/app.prescription.inventory.medicine.html',
      controller: 'prescription.itemview'
    })
    .state('prescription.subview', {
      url: '/subcategory/:cat',
      templateUrl: '/static/ngTemplates/app.prescription.inventory.submedicine.html',
      controller: 'prescription.subview'
    })
    .state('prescription.addInventory', {
      url: '/order/:inventory/:type',
      templateUrl: '/static/ngTemplates/app.inventory.addorders.html',
      controller: 'prescription.addInventory'
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
app.controller('controller.addInventory', function($scope,category,medicine, $state, $http, $timeout,$rootScope, $interval,Flash, $uibModal, $users) {
  $scope.id = category
  $scope.mainMedicine = medicine
  console.log($scope.mainMedicine)
  $scope.types = ['Box','Strip','Quantity']
  $scope.resetForm = function(){
    $scope.form = {
      title:'',
      price:0,
      type:$scope.types[0],
      category:$scope.id,
      number_of_boxes:0,
      number_of_strips:0,
      number_of_medicines:0,
      expiry_date:'',
      medicine:$scope.mainMedicine,
      quantity:0,
    }
  }
  $scope.resetForm();
  $scope.is_converted = false;
  $scope.changeState = function(){
    if($scope.is_converted){
      $scope.is_converted = false;
      return
    }
    if(!$scope.is_converted){
      $scope.convertall();
      $scope.is_converted = true;
      return
    }
  }
  $scope.convert = function(type){

    if(type=='strip'){
      if ($scope.form.number_of_strips >= $scope.form.medicine.strips_per_boxes){
        $scope.form.number_of_boxes += Math.floor($scope.form.number_of_strips / $scope.form.medicine.strips_per_boxes);
        $scope.form.number_of_strips = $scope.form.number_of_strips % $scope.form.medicine.strips_per_boxes
      }
    }
    if(type=='medicine'){
      if ($scope.form.number_of_medicines >= $scope.form.medicine.medicines_per_strips){
        $scope.form.number_of_strips += Math.floor($scope.form.number_of_medicines / $scope.form.medicine.medicines_per_strips);
        $scope.form.number_of_medicines = $scope.form.number_of_medicines % $scope.form.medicine.medicines_per_strips
        if ($scope.form.number_of_strips >= $scope.form.medicine.strips_per_boxes){
          $scope.form.number_of_boxes += Math.floor($scope.form.number_of_strips / $scope.form.medicine.strips_per_boxes);
          $scope.form.number_of_strips = $scope.form.number_of_strips % $scope.form.medicine.strips_per_boxes
        }
      }
    }
    if(type=='liquidmedicine'){
      if($scope.form.number_of_medicines >= $scope.form.medicine.medicines_per_strips){
        $scope.form.number_of_boxes += Math.floor($scope.form.number_of_medicines / $scope.form.medicine.medicines_per_strips);
        $scope.form.number_of_medicines = $scope.form.number_of_medicines % $scope.form.medicine.medicines_per_strips
      }
    }
    $scope.addTotal()
  }
  $scope.convertall = function(){
    if(typeof $scope.form.medicine=='object'){
      if($scope.form.medicine.type=='Tablet'||$scope.form.medicine.type=='Capsules'){
        let total_strips = Math.floor($scope.form.quantity / $scope.form.medicine.medicines_per_strips);
        $scope.form.number_of_boxes  = Math.floor(total_strips / $scope.form.medicine.strips_per_boxes)
        $scope.form.number_of_strips  = Math.round(total_strips % $scope.form.medicine.strips_per_boxes)
        $scope.form.number_of_medicines  = Math.round($scope.form.quantity % $scope.form.medicine.medicines_per_strips)
        return
      }
      if($scope.form.medicine.type!='Tablet'&&$scope.form.medicine.type!='Capsules'){
        $scope.form.number_of_boxes  = Math.floor($scope.form.quantity / $scope.form.medicine.medicines_per_strips)
        $scope.form.number_of_medicines  = Math.round($scope.form.quantity % $scope.form.medicine.medicines_per_strips)
        return
      }
    }
  }
  $scope.addTotal = function(){

    if($scope.form.medicine.type=='Tablet'||$scope.form.medicine.type=='Capsules'){
      console.log($scope.form.required_boxes)
      $scope.form.quantity = 0
      $scope.form.quantity += ($scope.form.number_of_boxes * $scope.form.medicine.strips_per_boxes) * $scope.form.medicine.medicines_per_strips
      $scope.form.quantity += $scope.form.number_of_strips * $scope.form.medicine.medicines_per_strips
      $scope.form.quantity += $scope.form.number_of_medicines
      return;
    }
    if($scope.form.medicine.type!='Tablet'&&$scope.form.medicine.type!='Capsules'){
      $scope.form.quantity = ($scope.form.number_of_boxes * $scope.form.medicine.medicines_per_strips) + $scope.form.number_of_medicines
      return;
    }

  }
  $scope.addCategory = function(){
    if(!$scope.is_converted){
      Flash.create('danger','please press convert and proceed')
      return;
    }
    if($scope.form.quantity==0){
      Flash.create('success',"quantity shouldnt be null")
      return;
    }

    if(typeof $scope.form.expiry_date!='object'){
      delete $scope.form.expiry_date;
    }
    if(typeof $scope.form.expiry_date=='object'){
      $scope.form.expiry_date = dateToString($scope.form.expiry_date);
    }

    $http({
      method: 'POST',
      url: '/api/prescription/createSubInventories/',
      data: $scope.form
    }).
    then(function(response) {
      if (response.status == 200) {
        Flash.create('success', "added successfully");
        $scope.resetForm();

      } else {
        Flash.create('danger', response.status + ' : ' + response.statusText + ' - ' + 'Error');
      }
    })
  }

})
app.controller('prescription.subview', function($scope, $state, $http, $timeout,$rootScope, $interval,Flash, $uibModal, $users,$aside) {
  $scope.mainId = $state.params.cat
  $scope.limit = 6
  $scope.offset = 0
  $scope.currentPage = 1

  $scope.addItem = function() {
      $aside.open({
        templateUrl: '/static/ngTemplates/app.inventory.itemadd.html',
        size: 'md',
        backdrop: true,
        placement:'right',
        resolve: {
          category: function() {
            return $scope.mainId
          },
          medicine:function(){
            return $scope.main
          },

          // allExams : function() {
          //   return $scope.allExams;
          // }

        },
        controller: 'controller.addInventory'
      }).result.then(function() {
      }, function() {
        $scope.allCategory();
    })
    }

  $scope.allCategory = function() {
    $http({
        method: 'GET',
        url: '/api/prescription/subinventory/?limit=' + $scope.limit + '&offset=' + $scope.offset + '&category=' + $scope.mainId,
      })
      .then(function(response) {
        $scope.allItems = response.data.results
        $scope.total = response.data.count
        $scope.prev = response.data.prev
        $scope.next = response.data.next
      })
  }

  // $scope.getStudents()
  $scope.pageChanged = function(currentPage) {
    $scope.currentPage = currentPage
    $scope.offset = $scope.limit * ($scope.currentPage - 1)
    $scope.allCategory()

  }
  $scope.mainCategory = function() {
    $http({
        method: 'GET',
        url: '/api/prescription/maincategory/'+$scope.mainId+'/',
      })
      .then(function(response) {
        $scope.main = response.data
        $scope.allCategory()
      })
  }
  $scope.mainCategory();
  $scope.deleteCategory = function(id) {
    $http({
        method: 'DELETE',
        url: '/api/prescription/subinventory/'+id+'/',
      })
      .then(function(response) {
        Flash.create('success','deleted succesfully');
        $scope.allCategory()
      })
  }

});
app.controller('controller.addInventoryMedicines', function($scope,main, $state, $http, $timeout,$rootScope, $interval,Flash, $uibModal, $users) {
  $scope.id = main
  $scope.types = ['Liquid','Tablet','Capsules','Cream','Drops','Injections','Inhalers','Suppositories','Others']
  $scope.resetForm = function(){
    $scope.form = {
      title:'',
      price:0,
      min_quantity:0,
      medicines_per_strips:0,
      strips_per_boxes:0,
      type:$scope.types[0],
      category:$scope.id,
    }
  }
  $scope.medicineSelect = function(){
    console.log("imselected")
    $scope.form.type = $scope.form.title.type
  }

  $scope.medicineSearch = function(query) {
    return $http.get('/api/prescription/medicines/?name=' + query).
    then(function(response) {
      return response.data;
    })
  }
  $scope.resetForm();
  $scope.addCategory = function(){

    if($scope.form.title.length==0){
      Flash.create('warning',"kindly select the title")
      return;
    }
    if($scope.form.price == 0){
      Flash.create('warning',"price will be greated than 0")
      return;
    }
    if( $scope.form.min_quantity == 0){
      Flash.create('warning',"min quantity will be greated than 0")
      return;
    }
    if( $scope.form.medicines_per_strips == 0){
      Flash.create('warning',"medicines_per_strips will be greated than 0")
      return;
    }

    if(!Number.isInteger($scope.form.price)){
      Flash.create('warning',"price should be integer")
      return;
    }
    if(!Number.isInteger($scope.form.min_quantity)){
      Flash.create('warning',"min quantity should be integer")
      return;
    }
    if(!Number.isInteger($scope.form.medicines_per_strips)){
      Flash.create('warning',"medicines_per_strips should be integer")
      return;
    }
    if($scope.form.type=='Tablet'||$scope.form.type=='Capsules'){
      if(!Number.isInteger($scope.form.strips_per_boxes)){
        Flash.create('warning',"strips_per_boxes should be integer")
        return;
      }
      if( $scope.form.strips_per_boxes == 0){
        Flash.create('warning',"strips_per_boxes will be greated than 0")
        return;
      }
    }
    if(typeof $scope.form.title == 'object'){
      $scope.form.title =  $scope.form.title.title
    }

    $http({
      method: 'POST',
      url: '/api/prescription/createSubs/',
      data: $scope.form
    }).
    then(function(response) {
      if (response.status == 200) {
        Flash.create('success', "added successfully");
        $scope.resetForm();
        $scope.allCategory();
      } else {
        Flash.create('danger', response.status + ' : ' + response.statusText + ' - ' + 'Error');
      }
    })
  }
});
app.controller('prescription.itemview', function($scope, $state, $http, $timeout,$rootScope, $interval,Flash, $uibModal, $users,$aside) {
  $scope.id = $state.params.id
  $scope.limit = 6
  $scope.offset = 0
  $scope.currentPage = 1
  $scope.types = ['Liquid','Tablet','Capsules','Cream','Drops','Injections','Inhalers','Suppositories','Others']
  $scope.resetForm = function(){
    $scope.form = {
      title:'',
      price:null,
      min_quantity:null,
      type:$scope.types[0],
      category:$scope.id,
    }
  }
  $scope.resetForm();



  $scope.addMedicine = function() {
      $aside.open({
        templateUrl: '/static/ngTemplates/app.inventorymedicines.add.html',
        size: 'md',
        backdrop: true,
        placement:'right',
        resolve: {
          main: function() {
            return $state.params.id
          },

          // allExams : function() {
          //   return $scope.allExams;
          // }

        },
        controller: 'controller.addInventoryMedicines'
      }).result.then(function() {
      }, function() {
        $scope.allCategory();

    })
    }
  $scope.medicineSelect = function(){
    console.log("imselected")
    $scope.form.type = $scope.form.medicine.type
  }

  $scope.medicineSearch = function(query) {
    return $http.get('/api/prescription/medicines/?name=' + query).
    then(function(response) {
      return response.data;
    })
  }
  $scope.itemView = function(idx){
    console.log(idx)
    $state.go('prescription.subview',{cat:idx})

  }
  $scope.addCategory = function(){

    if($scope.form.title.length==0){
      Flash.create('success',"kindly select the title")
      return;
    }
    if(typeof $scope.form.price == 0){
      Flash.create('success',"price will be greated than 0")
      return;
    }
    if(typeof $scope.form.min_quantity == 0){
      Flash.create('success',"min quantity will be greated than 0")
      return;
    }
    if(!Number.isInteger($scope.form.price)){
      Flash.create('success',"price should be integer")
      return;
    }
    if(!Number.isInteger($scope.form.min_quantity)){
      Flash.create('success',"min quantity should be integer")
      return;
    }
    if(typeof $scope.form.title == 'object'){
      $scope.form.title =  $scope.form.title.title
    }

    $http({
      method: 'POST',
      url: '/api/prescription/createSubs/',
      data: $scope.form
    }).
    then(function(response) {
      if (response.status == 200) {
        Flash.create('success', "added successfully");
        $scope.resetForm();
        $scope.allCategory();
      } else {
        Flash.create('danger', response.status + ' : ' + response.statusText + ' - ' + 'Error');
      }
    })
  }
  $scope.allCategory = function() {
    $http({
        method: 'GET',
        url: '/api/prescription/maincategory/?limit=' + $scope.limit + '&offset=' + $scope.offset + '&category=' + $scope.id,
      })
      .then(function(response) {
        $scope.allItems = response.data.results
        $scope.total = response.data.count
        $scope.prev = response.data.prev
        $scope.next = response.data.next
      })
  }

  // $scope.getStudents()
  $scope.pageChanged = function(currentPage) {
    $scope.currentPage = currentPage
    $scope.offset = $scope.limit * ($scope.currentPage - 1)
    $scope.allCategory()

  }
  $scope.mainCategory = function() {
    $http({
        method: 'GET',
        url: '/api/prescription/inventorycategory/'+$scope.id+'/',
      })
      .then(function(response) {
        $scope.main = response.data
        $scope.allCategory()
      })
  }
  $scope.deleteCategory = function(id) {
    $http({
        method: 'DELETE',
        url: '/api/prescription/maincategory/'+id+'/',
      })
      .then(function(response) {
        Flash.create('success','deleted succesfully');
        $scope.allCategory()
      })
  }
  $scope.mainCategory();

});
app.controller('controller.addInventoryOrder', function($scope, category,$state, $http, $timeout,$rootScope, $interval,Flash, $uibModal, $users) {
  $scope.clinic = category
  $scope.status = ['Pending','Cancelled','Received','Distrubutor Cancelled']
  $scope.resetForm = function(){
    $scope.form = {
      status:$scope.status[0],
      order_details:'',
      expected_arriving:new Date,
      discount:0,
      amount:0,
      clinic:$scope.clinic,
    }
  }
  $scope.resetForm();
  $scope.addOrder = function(){
    if($scope.form.amount==0){
      Flash.create('success',"kindly select the title")
      return;
    }
    if($scope.form.order_details.length==0){
      Flash.create('success',"kindly enter the details")
      return;
    }
    $scope.form.expected_arriving = dateToString($scope.form.expected_arriving)
    console.log($scope.form.excepted_arriving)
    $http({
      method: 'POST',
      url: '/api/prescription/createOrders/',
      data: $scope.form
    }).
    then(function(response) {
      if (response.status == 200) {
        Flash.create('success', "added successfully");
        $scope.resetForm();
      } else {
        Flash.create('danger', response.status + ' : ' + response.statusText + ' - ' + 'Error');
      }
    })
  }
});
app.controller('controller.addOrderMedicines', function($scope,course,obj ,inventory,$state, $http, $timeout,$rootScope, $uibModalInstance,$interval,Flash, $users,$aside) {
  $scope.type = course
  $scope.obj = obj
  $scope.inventory = inventory
  $scope.types = ['Liquid','Tablet','Capsules','Cream','Drops','Injections','Inhalers','Suppositories','Others']
  $scope.resetForm = function(){
    $scope.form = {
      medicine:'',
      required_boxes:0,
      required_strips:0,
      required_pieces:0,
      expiry_date:new Date,
      quantity:0,
      type:$scope.types[0]
    }
  }
  $scope.resetForm()
  $scope.convert = function(type){
    if(typeof $scope.form.medicine!='object'){
      Flash.create('danger','kindly select the medicine and enter the rest details');
      return;
    }
    if(type=='strip'){
      if ($scope.form.required_strips >= $scope.form.medicine.strips_per_boxes){
        $scope.form.required_boxes += Math.floor($scope.form.required_strips / $scope.form.medicine.strips_per_boxes);
        $scope.form.required_strips = $scope.form.required_strips % $scope.form.medicine.strips_per_boxes
      }
    }
    if(type=='medicine'){
      if ($scope.form.required_pieces >= $scope.form.medicine.medicines_per_strips){
        $scope.form.required_strips += Math.floor($scope.form.required_pieces / $scope.form.medicine.medicines_per_strips);
        $scope.form.required_pieces = $scope.form.required_pieces % $scope.form.medicine.medicines_per_strips
        if ($scope.form.required_strips >= $scope.form.medicine.strips_per_boxes){
          $scope.form.required_boxes += Math.floor($scope.form.required_strips / $scope.form.medicine.strips_per_boxes);
          $scope.form.required_strips = $scope.form.required_strips % $scope.form.medicine.strips_per_boxes
        }
      }
    }
    if(type=='liquidmedicine'){
      if($scope.form.required_pieces >= $scope.form.medicine.medicines_per_strips){
        $scope.form.required_boxes += Math.floor($scope.form.required_pieces / $scope.form.medicine.medicines_per_strips);
        $scope.form.required_pieces = $scope.form.required_pieces % $scope.form.medicine.medicines_per_strips
      }
    }
    $scope.addTotal()
  }
  $scope.medicineSearch = function(query) {
    return $http.get('/api/prescription/subSearch/?name=' + query+'&inventory='+$scope.inventory).
    then(function(response) {
      return response.data;
    })
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
  $scope.close = function(){
    $uibModalInstance.dismiss("empty")
  }
  $scope.add = function(){
      if($scope.form.medicine.type=='Tablet'||$scope.form.medicine.type=='Capsules'){
        let total_strips = Math.floor($scope.form.quantity / $scope.form.medicine.medicines_per_strips);
        $scope.form.required_boxes  = Math.floor(total_strips / $scope.form.medicine.strips_per_boxes)
        $scope.form.required_strips  = Math.round(total_strips % $scope.form.medicine.strips_per_boxes)
        $scope.form.required_pieces  = Math.round($scope.form.quantity % $scope.form.medicine.medicines_per_strips)
      }
      if($scope.form.medicine.type!='Tablet'&&$scope.form.medicine.type!='Capsules'){
        $scope.form.required_boxes  = Math.floor($scope.form.quantity / $scope.form.medicine.medicines_per_strips)
        $scope.form.required_pieces  = Math.round($scope.form.quantity % $scope.form.medicine.medicines_per_strips)
      }

    $uibModalInstance.dismiss($scope.form)
  }
  $scope.addTotal = function(){
    if(typeof $scope.form.medicine!='object'){
      Flash.create('danger','kindly select the medicine and enter the rest details');
      return;
    }
    if($scope.form.medicine.type=='Tablet'||$scope.form.medicine.type=='Capsules'){
      console.log($scope.form.required_boxes)
      $scope.form.quantity = 0
      $scope.form.quantity += ($scope.form.required_boxes * $scope.form.medicine.strips_per_boxes) * $scope.form.medicine.medicines_per_strips
      $scope.form.quantity += $scope.form.required_strips * $scope.form.medicine.medicines_per_strips
      $scope.form.quantity += $scope.form.required_pieces
      return;
    }
    if($scope.form.medicine.type!='Tablet'||$scope.form.medicine.type!='Capsules'){
      $scope.form.quantity = ($scope.form.required_boxes * $scope.form.medicine.medicines_per_strips) + $scope.form.required_pieces
      return;
    }

  }

});
app.controller('prescription.addInventory', function($scope, $state, $http, $timeout,$rootScope, $interval,Flash, $uibModal, $users,$aside) {
  $scope.status = ['Pending','Cancelled','Distrubutor Cancelled']
  $scope.inventory = $state.params.inventory
  $scope.minType = $state.params.type
  $scope.resetForm = function(){
    $scope.form = {
      from_contactNo:null,
      from_contact:null,
      amount:0,
      status:$scope.status[0],
      order_details:'',
      expected_arriving:new Date,
      discount:0,
      inventory:$state.params.inventory,
      orderitems:[],

    }
  }
  $scope.resetForm();

  $scope.changeOrderItems = function(){
      $http({
          method: 'GET',
          url: '/api/prescription/showMinimum/?inventory=' + $scope.inventory,
        })
        .then(function(response) {
          $scope.form.orderitems = response.data
        })
  }
  

  $scope.addMedicine = function(item,obj,index) {
      console.log(item);
      $uibModal.open({
        templateUrl: '/static/ngTemplates/app.subinventory.order.html',
        size: 'lg',
        backdrop:false,
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
          inventory:function(){
            return $scope.inventory
          },
          // allExams : function() {
          //   return $scope.allExams;
          // }

        },
        controller: 'controller.addOrderMedicines'
      }).result.then(function() {
      }, function(data) {
        if(data!="empty"){
          if(item=='edit'){
            $scope.form.orderitems[index] = data
            Flash.create('success',"order edited succesfully")
            return;
          }
          $scope.form.orderitems.push(data)
          Flash.create('success',"order added succesfully")
          console.log($scope.medicines,"uimhwaefuhhuawef")
        }

    })
    }
    $scope.deleteItem = function(indx){
      $scope.form.orderitems.splice(indx,1);
      Flash.create('success','order edited succesfully')
    }

    $scope.postOrder = function(){
      if($scope.form.from_contactNo==null||$scope.form.from_contactNo.length==0){
        Flash.create('danger','kindly enter the contact no ')
      }
      if($scope.form.from_contact==null||$scope.form.from_contact.length==0){
        Flash.create('danger','kindly enter the from_contact name ')
      }
      if($scope.form.amount==0){
        Flash.create('danger','amount should be greater than 0 ')
      }
      if($scope.form.orderitems.length==0){
        Flash.create('danger','kindly add atleast one medicine')
      }
      if(typeof $scope.form.expected_arriving=='object'){
        $scope.form.expected_arriving = dateToString($scope.form.expected_arriving)
      }
      $http({
        method: 'POST',
        url: '/api/prescription/createOrders/',
        data: $scope.form
      }).
      then(function(response) {
        if (response.status == 200) {
          Flash.create('success', "order created successfully");
          $scope.resetForm();
        } else {
          Flash.create('danger', response.status + ' : ' + response.statusText + ' - ' + 'Error');
        }
      })

    }


});
app.controller('controller.addInventoryShowBill', function($scope, $state, $http,main, $timeout,$rootScope, $interval,Flash, $uibModalInstance, $users,$aside) {
  $scope.form = main
});
app.controller('controller.addInventoryShowItems', function($scope, $state, $http,main, $timeout,$rootScope, $interval,Flash, $uibModalInstance, $users,$aside) {
  $scope.form = main
});
app.controller('controller.addInventoryBill', function($scope, $state, $http,inventory,clinic, $timeout,$rootScope, $interval,Flash, $uibModalInstance, $users,$aside) {
  $scope.inventory = inventory
  $scope.resetForm = function(){
    $scope.form = {
      contact_no:'',
      contact_details:'',
      discount:0,
      amount:0,
      date:new Date,
      items:[],
      inventory:$scope.inventory,
    }
  }
  $scope.resetForm()
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
    $scope.itemAdd.itemprice = $scope.itemAdd.item.price * $scope.itemAdd.quantity
    $scope.form.items.push($scope.itemAdd)

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
        Flash.create('success', "order created successfully");
        // $scope.resetForm();
      } else {
        Flash.create('danger', response.status + ' : ' + response.statusText + ' - ' + 'Error');
      }
    })

  }
  });
app.controller('prescription.inventory', function($scope, $state, $http, $timeout,$rootScope, $interval,Flash, $uibModal, $users,$aside) {
$scope.name = "inventory";
$scope.itemList = true;
  $scope.loss = false;
  $scope.orders = false;
  $scope.changeState = function(state){
    if(state=='itemList'){
      $scope.itemList = true;
      $scope.loss = false;
      $scope.orders = false;
    }
    if(state=='orders'){
      $scope.itemList = false;
      $scope.loss = false;
      $scope.orders = true;
    }
    if(state=='loss'){
      $scope.itemList = false;
      $scope.loss = true;
      $scope.orders = false;
    }
  }
  $scope.changeClinic = function(){
    $scope.allCategory();
    $scope.allOrders();
    $scope.allSolds();

  }
  $scope.resetCategoryForm = function(){
    $scope.categoryForm = {
      title:'',
      clinic:'',
    }
  }
  $scope.resetCategoryForm();

  $scope.orderState = function(type){
    $state.go('prescription.addInventory',{inventory:$scope.selectedClinic.obj.inventory,'type':type})
  }
  $scope.deleteOrder = function(id) {
    $http({
        method: 'DELETE',
        url: '/api/prescription/inventoryorders/'+id+'/',
      })
      .then(function(response) {
        Flash.create('success','deleted succesfully');
        $scope.allOrders()
      })
  }
  $scope.soldDelete = function(id) {
    $http({
        method: 'DELETE',
        url: '/api/prescription/soldinventory/'+id+'/',
      })
      .then(function(response) {
        Flash.create('success','deleted succesfully');
        $scope.allSolds()
      })
  }
  $scope.deleteCategory = function(id) {
    $http({
        method: 'DELETE',
        url: '/api/prescription/inventorycategory/'+id+'/',
      })
      .then(function(response) {
        Flash.create('success','deleted succesfully');
        $scope.allCategory()
      })
  }
  $scope.addOrder = function() {
      $aside.open({
        templateUrl: '/static/ngTemplates/app.inventory.addorder.html',
        size: 'md',
        backdrop: true,
        placement:'right',
        resolve: {
          category: function() {
            return $scope.selectedClinic.obj.clinicpk
          },

          // allExams : function() {
          //   return $scope.allExams;
          // }

        },
        controller: 'controller.addInventoryOrder'
      }).result.then(function() {
      }, function() {
        $scope.allOrders();

    })
    }
  $scope.addBill = function() {
      $aside.open({
        templateUrl: '/static/ngTemplates/app.inventory.addbill.html',
        size: 'xlg',
        backdrop: true,
        placement:'right',
        resolve: {
          clinic: function() {
            return $scope.selectedClinic.obj.clinicpk
          },
          inventory: function() {
            return $scope.selectedClinic.obj.inventory
          },

          // allExams : function() {
          //   return $scope.allExams;
          // }

        },
        controller: 'controller.addInventoryBill'
      }).result.then(function() {
      }, function() {
        $scope.allSolds();

    })
    }
  $scope.showBill = function(obj) {
      $aside.open({
        templateUrl: '/static/ngTemplates/app.inventory.showbill.html',
        size: 'lg',
        backdrop: true,
        placement:'right',
        resolve: {

          main: function() {
            return obj
          },

          // allExams : function() {
          //   return $scope.allExams;
          // }

        },
        controller: 'controller.addInventoryShowBill'
      }).result.then(function() {
      }, function() {

    })
    }
  $scope.showOrderItems = function(obj) {
      $aside.open({
        templateUrl: '/static/ngTemplates/app.inventory.showitems.html',
        size: 'lg',
        backdrop: true,
        placement:'right',
        resolve: {

          main: function() {
            return obj
          },

          // allExams : function() {
          //   return $scope.allExams;
          // }

        },
        controller: 'controller.addInventoryShowItems'
      }).result.then(function() {
      }, function() {

    })
    }

  $scope.addCategory = function(){
    if($scope.categoryForm.title.length==0){
      Flash.create('success',"kindly select the title")
      return;
    }
    if(typeof $scope.selectedClinic.obj != 'object'){
      Flash.create('success',"kindly select the clinic")
      return;
    }
    $scope.categoryForm.clinic = $scope.selectedClinic.obj.clinicpk

    $http({
      method: 'POST',
      url: '/api/prescription/createCategory/',
      data: $scope.categoryForm
    }).
    then(function(response) {
      if (response.status == 200) {
        Flash.create('success', "added successfully");
        $scope.resetCategoryForm();
        $scope.allCategory();
      } else {
        Flash.create('danger', response.status + ' : ' + response.statusText + ' - ' + 'Error');
      }
    })
  }
  $scope.itemView = function(idx){
    console.log(idx)
    $state.go('prescription.itemview',{id:idx})

  }
  $scope.selectedClinic = {
    obj:'',
    search:'',
    date:new Date,
  }
  $scope.limit = 6
  $scope.offset = 0
  $scope.currentPage = 1
  $scope.allCategory = function() {
    $http({
        method: 'GET',
        url: '/api/prescription/inventorycategory/?limit=' + $scope.limit + '&offset=' + $scope.offset + '&inventory=' + $scope.selectedClinic.obj.inventory,
      })
      .then(function(response) {
        $scope.allItems = response.data.results
        $scope.total = response.data.count
        $scope.prev = response.data.prev
        $scope.next = response.data.next
      })
  }

  // $scope.getStudents()
  $scope.pageChanged = function(currentPage) {
    $scope.currentPage = currentPage
    $scope.offset = $scope.limit * ($scope.currentPage - 1)
    $scope.allCategory()

  }
  $scope.limitt = 6
  $scope.offsett = 0
  $scope.currentPagee = 1
  $scope.allOrders = function() {
    $http({
        method: 'GET',
        url: '/api/prescription/inventoryorders/?limit=' + $scope.limit + '&offset=' + $scope.offset + '&inventory=' + $scope.selectedClinic.obj.inventory,
      })
      .then(function(response) {
        $scope.orderss = response.data.results
        $scope.totall = response.data.count
        $scope.prevv = response.data.prev
        $scope.nextt = response.data.next
      })
  }

  // $scope.getStudents()
  $scope.pageChangedd = function(currentPage) {
    $scope.currentPagee = currentPage
    $scope.offsett = $scope.limitt * ($scope.currentPagee - 1)
    $scope.allOrders()

  }
  $scope.limittt = 6
  $scope.offsettt = 0
  $scope.currentPageee = 1
  $scope.allSolds = function() {
    $http({
        method: 'GET',
        url: '/api/prescription/soldinventory/?limit=' + $scope.limit + '&offset=' + $scope.offset + '&inventory=' + $scope.selectedClinic.obj.inventory,
      })
      .then(function(response) {
        $scope.solds = response.data.results
        $scope.totalll = response.data.count
        $scope.prevvv = response.data.prev
        $scope.nexttt = response.data.next
      })
  }

  // $scope.getStudents()
  $scope.pageChangeddd = function(currentPage) {
    $scope.currentPageee = currentPage
    $scope.offsettt = $scope.limittt * ($scope.currentPageee - 1)
    $scope.allSolds()

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
        $scope.allCategory()
        $scope.allOrders()
        $scope.allSolds()

      }



      // console.log($scope.products);
    })
  }

  $scope.editOrders = function(obj) {
    console.log(obj)
    $aside.open({
      templateUrl: '/static/ngTemplates/app.order.edit.html',
      size: 'md',
      backdrop: true,
      resolve : {
        obj : function() {
          return obj
        },
      },
      controller: function($scope, $uibModalInstance, $rootScope, obj) {
        $scope.obj = obj
        $scope.close = function() {
          $uibModalInstance.close();
        }
        $scope.status = ['Pending','Cancelled','Received','Distrubutor Cancelled']

        $scope.form = {
          expected_arriving:dateToString($scope.obj.expected_arriving),
          status:$scope.obj.status,
          discount:$scope.obj.discount,
          amount:$scope.obj.amount,
          order_details:$scope.obj.order_details,
          order:$scope.obj.id,
          from_contact:$scope.obj.from_contact,
          from_contactNo:$scope.obj.from_contactNo,

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
          if(typeof $scope.form.expected_arriving =='object'){
            $scope.form.expected_arriving = dateToString($scope.form.expected_arriving)
          }
          $http({
            method: 'POST',
            url: '/api/prescription/createOrders/',
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
      $scope.allOrders()
    });

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
