app.directive('filesDrop', ['$parse', function ($parse) {
  return {
    restrict: 'A',
    link: function($scope, element, attrs) {

      // element.bind('dragover', processDragOverOrEnter);
      // element.bind('dragenter', processDragOverOrEnter);
      // element.bind('dragend', endDragOver);
      // element.bind('dragleave', endDragOver);
      element.bind('drop', function(event) {

          event.stopPropagation();
          event.preventDefault();
          // var event = angularEvent.originalEvent || angularEvent;
          var files = event.dataTransfer.files;
          $scope.$eval(attrs.onFileDrop)(files);

      });

      function processDragOverOrEnter(angularEvent) {
          var event = angularEvent.originalEvent || angularEvent;
          if (event) {
              event.preventDefault();
          }
          event.dataTransfer.effectAllowed = 'copy';
          element.addClass('dragging');
          return true;
      }

      function endDragOver() {
          element.removeClass('dragging');
      }





      }
    }
}]);


app.directive('fileModel', ['$parse', function ($parse) {
  return {
    restrict: 'A',
    link: function(scope, element, attrs) {
      var model = $parse(attrs.fileModel);
      var modelSetter = model.assign;

      element.bind('change', function(){
        scope.$apply(function(){
          modelSetter(scope, element[0].files[0]);
        });
      });
    }
  };
}]);

app.directive('filesModel', ['$parse', function ($parse) {
  return {
    restrict: 'A',
    link: function(scope, element, attrs) {
      var model = $parse(attrs.filesModel);
      var modelSetter = model.assign;

      element.bind('change', function(){
        scope.$apply(function(){
          modelSetter(scope, element[0].files);
        });
      });
    }
  };
}]);



/*
This directive allows us to pass a function in on an enter key to do what we want.
 */

app.directive('ngEnter', function () {
  return function (scope, element, attrs) {
    element.bind("keydown keypress", function (event) {
      if(event.which === 13) {
        scope.$apply(function (){
          scope.$eval(attrs.ngEnter);
        });
        event.preventDefault();
      }
    });
  };
});

app.directive('focusMe', function($timeout) {
  // bring any input into focus based on the focus-me = "true" attribute
  return {
    link: function(scope, element, attrs) {
      scope.$watch(attrs.focusMe, function(value) {
        if(value === true) {
          element[0].focus();
          scope[attrs.focusMe] = false;
        }
      });
    }
  };
});
