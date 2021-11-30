app.config(function($stateProvider) {

  $stateProvider
    .state('prescription.deployment', {
      url: '/deployment',
      templateUrl: '/static/ngTemplates/app.prescription.deployment.html',
      controller: 'prescription.deployment'
    })

});

app.controller('prescription.deployment', function($scope, $state, $http, $timeout, $interval,Flash, $uibModal, $users,$rootScope) {
$scope.name = "deployment";

$scope.months = ['ALLMONTH','January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
$scope.years = []
$scope.types = ['clinic','doctors']
$scope.choices = ['income','patients','appointments','peaktime']
$scope.resetForm = function(){
  $scope.form = {
    type:$scope.types[0],
    choices:$scope.choices[0],
    month:$scope.months[0],
    year:null,
    clinic:null,
    doctor:null,

  }
}
$scope.resetForm();

$scope.getYears = function(){
    var d = new Date();
    var n = d.getFullYear();
    $scope.years.push(n);
    for(let j =1;j<10;j++){
      $scope.years.push(n-j);
      $scope.years.push(n+j);
    }
    $scope.form.year=$scope.years[0]
  }
  $scope.getYears();
  $scope.getDoctors = function(id){
    $http({
      method: 'GET',
      url:  '/api/prescription/clinicDoctors/?clinic='+id
    }).
    then(function(response) {
      $scope.doctors = response.data
      $scope.form.doctor=$scope.doctors[0]
      $scope.setParams();

      // console.log($scope.products);
    })
  }
$scope.showTechnicianAside = function() {
  $scope.isShowTech = !$scope.isShowTech;
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
      $scope.form.clinic = $scope.ownedClinics[0]
      $scope.getDoctors($scope.ownedClinics[0].clinicpk)

    }



    // console.log($scope.products);
  })
}

  $scope.setParams = function(){
    if($scope.form.clinic.length==0){
      Flash.create('warning',"kindly select a clinic")
    }

    var url;
    if($scope.form.type=='clinic'){
      url = '/api/prescription/setClinicGraph/?clinic='+$scope.form.clinic.clinicpk+'&type='+$scope.form.type+'&choice='+$scope.form.choices + '&year=' + $scope.form.year + '&month='+$scope.months.indexOf($scope.form.month)
    }
    if($scope.form.type=='doctors'){
      url = '/api/prescription/setGraph/?clinic='+$scope.form.clinic.clinicpk+'&type='+$scope.form.type+'&choice='+$scope.form.choices + '&year=' + $scope.form.year + '&month='+$scope.months.indexOf($scope.form.month)
    }
    if($scope.form.choices=='appointments'||$scope.form.choices=='peaktime'){
      url = '/api/prescription/appointmentGraph/?clinic='+$scope.form.clinic.clinicpk+'&type='+$scope.form.type+'&choice='+$scope.form.choices + '&year=' + $scope.form.year + '&month='+$scope.months.indexOf($scope.form.month)
      if($scope.form.choices=='peaktime'){
        if($scope.form.type=='doctors'){
          if(typeof $scope.form.doctor == 'object'){
            url +='&doctor='+$scope.form.doctor.doctor.id
          }else{
            Flash.create('warning','kindly select the doctor');
            return;
          }
        }
      }
    }

    $http({
      method: 'GET',
      url:url,
    }).
    then(function(response) {
      if($scope.form.choices=='peaktime'){
        $scope.peakGraph(response.data)
        return;
      }
      if($scope.form.choices=='appointments'){
        $scope.appointmentGraph(response.data)
        return;
      }
      if($scope.form.type=='doctors'){
        $scope.doctorGraph(response.data)
      }
      if($scope.form.type=='clinic'){
        $scope.clinicGraph(response.data)
      }

      // console.log($scope.products);
    })
  }
  $scope.doctorGraph = function(data){
    am4core.ready(function() {

// Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end

      /**
       * Chart design taken from Samsung health app
       */

      var chart = am4core.create("chartdiv", am4charts.XYChart);
      chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

      chart.paddingBottom = 30;

      chart.data = data

      var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
      categoryAxis.dataFields.category = "name";
      categoryAxis.renderer.grid.template.strokeOpacity = 0;
      categoryAxis.renderer.minGridDistance = 10;
      categoryAxis.renderer.labels.template.dy = 35;
      categoryAxis.renderer.tooltip.dy = 35;

      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.renderer.inside = true;
      valueAxis.renderer.labels.template.fillOpacity = 0.3;
      valueAxis.renderer.grid.template.strokeOpacity = 0;
      valueAxis.min = 0;
      valueAxis.cursorTooltipEnabled = false;
      valueAxis.renderer.baseGrid.strokeOpacity = 0;

      var series = chart.series.push(new am4charts.ColumnSeries);
      series.dataFields.valueY = "acheived";
      series.dataFields.categoryX = "name";
      series.tooltipText = "{valueY.value}";
      series.tooltip.pointerOrientation = "vertical";
      series.tooltip.dy = - 6;
      series.columnsContainer.zIndex = 100;

      var columnTemplate = series.columns.template;
      columnTemplate.width = am4core.percent(50);
      columnTemplate.maxWidth = 66;
      columnTemplate.column.cornerRadius(60, 60, 10, 10);
      columnTemplate.strokeOpacity = 0;

      series.heatRules.push({ target: columnTemplate, property: "fill", dataField: "valueY", min: am4core.color("#e5dc36"), max: am4core.color("#5faa46") });
      series.mainContainer.mask = undefined;

      var cursor = new am4charts.XYCursor();
      chart.cursor = cursor;
      cursor.lineX.disabled = true;
      cursor.lineY.disabled = true;
      cursor.behavior = "none";

      var bullet = columnTemplate.createChild(am4charts.CircleBullet);
      bullet.circle.radius = 30;
      bullet.valign = "bottom";
      bullet.align = "center";
      bullet.isMeasured = true;
      bullet.mouseEnabled = false;
      bullet.verticalCenter = "bottom";
      bullet.interactionsEnabled = false;

      var hoverState = bullet.states.create("hover");
      var outlineCircle = bullet.createChild(am4core.Circle);
      outlineCircle.adapter.add("radius", function (radius, target) {
          var circleBullet = target.parent;
          return circleBullet.circle.pixelRadius + 10;
      })

      var image = bullet.createChild(am4core.Image);
      image.width = 60;
      image.height = 60;
      image.horizontalCenter = "middle";
      image.verticalCenter = "middle";
      image.propertyFields.href = "href";

      image.adapter.add("mask", function (mask, target) {
          var circleBullet = target.parent;
          return circleBullet.circle;
      })

      var previousBullet;
      chart.cursor.events.on("cursorpositionchanged", function (event) {
          var dataItem = series.tooltipDataItem;

          if (dataItem.column) {
              var bullet = dataItem.column.children.getIndex(1);

              if (previousBullet && previousBullet != bullet) {
                  previousBullet.isHover = false;
              }

              if (previousBullet != bullet) {

                  var hs = bullet.states.getKey("hover");
                  hs.properties.dy = -bullet.parent.pixelHeight + 30;
                  bullet.isHover = true;

                  previousBullet = bullet;
              }
          }
      })

      }); // end am4core.ready()
  }
  $scope.peakGraph = function(data){
    am4core.ready(function() {

    // Themes begin
    am4core.useTheme(am4themes_animated);
    // Themes end

    var chart = am4core.create("chartdiv", am4charts.XYChart);


    var value = 120;

    // var names = ["Raina",
    //   "Demarcus",
    //   "Carlo",
    //   "Jacinda",
    //   "Richie",
    //   "Antony",
    //   "Amada",
    //   "Idalia",
    //   "Janella",
    //   "Marla",
    //   "Curtis",
    //   "Shellie",
    //   "Meggan",
    //   "Nathanael",
    //   "Jannette",
    //   "Tyrell",
    //   "Sheena",
    //   "Maranda",
    //   "Briana",
    //   "Rosa",
    //   "Rosanne",
    //   "Herman",
    //   "Wayne",
    //   "Shamika",
    //   "Suk",
    //   "Clair",
    //   "Olivia",
    //   "Hans",
    //   "Glennie",
    // ];
    //
    // for (var i = 0; i < names.length; i++) {
    //   value += Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 5);
    //   data.push({ category: names[i], value: value });
    // }

    chart.data = data;
    var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
    categoryAxis.renderer.grid.template.location = 0;
    categoryAxis.dataFields.category = "name";
    categoryAxis.renderer.minGridDistance = 15;
    categoryAxis.renderer.grid.template.location = 0.5;
    categoryAxis.renderer.grid.template.strokeDasharray = "1,3";
    categoryAxis.renderer.labels.template.rotation = -90;
    categoryAxis.renderer.labels.template.horizontalCenter = "left";
    categoryAxis.renderer.labels.template.location = 0.5;

    categoryAxis.renderer.labels.template.adapter.add("dx", function(dx, target) {
        return -target.maxRight / 2;
    })

    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
    valueAxis.tooltip.disabled = true;
    valueAxis.renderer.ticks.template.disabled = true;
    valueAxis.renderer.axisFills.template.disabled = true;

    var series = chart.series.push(new am4charts.ColumnSeries());
    series.dataFields.categoryX = "name";
    series.dataFields.valueY = "count";
    series.tooltipText = "{valueY.value}";
    series.sequencedInterpolation = true;
    series.fillOpacity = 0;
    series.strokeOpacity = 1;
    series.strokeDashArray = "1,3";
    series.columns.template.width = 0.01;
    series.tooltip.pointerOrientation = "horizontal";

    var bullet = series.bullets.create(am4charts.CircleBullet);

    chart.cursor = new am4charts.XYCursor();

    chart.scrollbarX = new am4core.Scrollbar();
    chart.scrollbarY = new am4core.Scrollbar();


    }); // end am4core.ready()
  }
  $scope.clinicGraph = function(data){
    am4core.ready(function() {

// Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end

      // Create chart instance
      var chart = am4core.create("chartdiv", am4charts.XYChart);
      chart.scrollbarX = new am4core.Scrollbar();
      chart.data = data
      // Add data
      // chart.data = [{
      //   "country": "USA",
      //   "visits": 3025
      // }, {
      //   "country": "China",
      //   "visits": 1882
      // }, {
      //   "country": "Japan",
      //   "visits": 1809
      // }, {
      //   "country": "Germany",
      //   "visits": 1322
      // }, {
      //   "country": "UK",
      //   "visits": 1122
      // }, {
      //   "country": "France",
      //   "visits": 1114
      // }, {
      //   "country": "India",
      //   "visits": 984
      // }, {
      //   "country": "Spain",
      //   "visits": 711
      // }, {
      //   "country": "Netherlands",
      //   "visits": 665
      // }, {
      //   "country": "Russia",
      //   "visits": 580
      // }, {
      //   "country": "South Korea",
      //   "visits": 443
      // }, {
      //   "country": "Canada",
      //   "visits": 441
      // }];

      // Create axes
      var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
      categoryAxis.dataFields.category = "name";
      categoryAxis.renderer.grid.template.location = 0;
      categoryAxis.renderer.minGridDistance = 30;
      categoryAxis.renderer.labels.template.horizontalCenter = "right";
      categoryAxis.renderer.labels.template.verticalCenter = "middle";
      categoryAxis.renderer.labels.template.rotation = 270;
      categoryAxis.tooltip.disabled = true;
      categoryAxis.renderer.minHeight = 110;

      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.renderer.minWidth = 50;

      // Create series
      var series = chart.series.push(new am4charts.ColumnSeries());
      series.sequencedInterpolation = true;
      series.dataFields.valueY = "acheived";
      series.dataFields.categoryX = "name";
      series.tooltipText = "[{categoryX}: bold]{valueY}[/]";
      series.columns.template.strokeWidth = 0;

      series.tooltip.pointerOrientation = "vertical";

      series.columns.template.column.cornerRadiusTopLeft = 10;
      series.columns.template.column.cornerRadiusTopRight = 10;
      series.columns.template.column.fillOpacity = 0.8;

      // on hover, make corner radiuses bigger
      var hoverState = series.columns.template.column.states.create("hover");
      hoverState.properties.cornerRadiusTopLeft = 0;
      hoverState.properties.cornerRadiusTopRight = 0;
      hoverState.properties.fillOpacity = 1;

      series.columns.template.adapter.add("fill", function(fill, target) {
        return chart.colors.getIndex(target.dataItem.index);
      });

      // Cursor
      chart.cursor = new am4charts.XYCursor();

      }); // end am4core.ready()
    }

    $scope.appointmentGraph = function(data){
      am4core.ready(function() {

// Themes begin
      am4core.useTheme(am4themes_animated);
      // Themes end



      var chart = am4core.create('chartdiv', am4charts.XYChart)
      chart.colors.step = 2;

      chart.legend = new am4charts.Legend()
      chart.legend.position = 'top'
      chart.legend.paddingBottom = 20
      chart.legend.labels.template.maxWidth = 95

      var xAxis = chart.xAxes.push(new am4charts.CategoryAxis())
      xAxis.dataFields.category = 'name'
      xAxis.renderer.cellStartLocation = 0.1
      xAxis.renderer.cellEndLocation = 0.9
      xAxis.renderer.grid.template.location = 0;

      var yAxis = chart.yAxes.push(new am4charts.ValueAxis());
      yAxis.min = 0;

      function createSeries(value, name) {
          var series = chart.series.push(new am4charts.ColumnSeries())
          series.dataFields.valueY = value
          series.dataFields.categoryX = 'name'
          series.name = name

          series.events.on("hidden", arrangeColumns);
          series.events.on("shown", arrangeColumns);

          var bullet = series.bullets.push(new am4charts.LabelBullet())
          bullet.interactionsEnabled = false
          bullet.dy = 30;
          bullet.label.text = '{valueY}'
          bullet.label.fill = am4core.color('#ffffff')

          return series;
      }

      // chart.data = [
      //     {
      //         category: 'Place #1',
      //         first: 40,
      //         second: 55,
      //         third: 60
      //     },
      //     {
      //         category: 'Place #2',
      //         first: 30,
      //         second: 78,
      //         third: 69
      //     },
      //     {
      //         category: 'Place #3',
      //         first: 27,
      //         second: 40,
      //         third: 45
      //     },
      //     {
      //         category: 'Place #4',
      //         first: 50,
      //         second: 33,
      //         third: 22
      //     }
      // ]

      chart.data = data
      createSeries('requested', 'Requested');
      createSeries('completed', 'Completed');
      createSeries('others', 'Others');

      function arrangeColumns() {

          var series = chart.series.getIndex(0);

          var w = 1 - xAxis.renderer.cellStartLocation - (1 - xAxis.renderer.cellEndLocation);
          if (series.dataItems.length > 1) {
              var x0 = xAxis.getX(series.dataItems.getIndex(0), "categoryX");
              var x1 = xAxis.getX(series.dataItems.getIndex(1), "categoryX");
              var delta = ((x1 - x0) / chart.series.length) * w;
              if (am4core.isNumber(delta)) {
                  var middle = chart.series.length / 2;

                  var newIndex = 0;
                  chart.series.each(function(series) {
                      if (!series.isHidden && !series.isHiding) {
                          series.dummyData = newIndex;
                          newIndex++;
                      }
                      else {
                          series.dummyData = chart.series.indexOf(series);
                      }
                  })
                  var visibleCount = newIndex;
                  var newMiddle = visibleCount / 2;

                  chart.series.each(function(series) {
                      var trueIndex = chart.series.indexOf(series);
                      var newIndex = series.dummyData;

                      var dx = (newIndex - trueIndex + middle - newMiddle) * delta

                      series.animate({ property: "dx", to: dx }, series.interpolationDuration, series.interpolationEasing);
                      series.bulletsContainer.animate({ property: "dx", to: dx }, series.interpolationDuration, series.interpolationEasing);
                  })
              }
          }
      }

      }); // end am4core.ready()

    }


});
