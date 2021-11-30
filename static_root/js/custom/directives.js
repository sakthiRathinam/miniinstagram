app.directive("contenteditable", function() {
  return {
    restrict: "A",
    require: "ngModel",
    link: function(scope, element, attrs, ngModel) {

      function read() {
        ngModel.$setViewValue(element.html());
      }

      ngModel.$render = function() {
        element.html(ngModel.$viewValue || "");
      };

      element.bind("blur keyup change", function() {
        scope.$apply(read);
      });
    }
  };
});

app.directive("flexibleInput", function() {
  return {
    restrict: "A",
    require: "ngModel",
    link: function(scope, element, attrs, ngModel) {
      setTimeout(function () {
        attrs.$set('size', element['0'].value.length)
      }, 500);
      function resize() {
        attrs.$set('size', element['0'].value.length)
      }

      element.bind("keyup", function() {
        scope.$apply(resize);
      });
    }
  };
});


app.directive("mathjaxBind", function() {
  return {
    restrict: "A",
    controller: ["$scope", "$element", "$attrs",
      function($scope, $element, $attrs) {
        $scope.$watch($attrs.mathjaxBind, function(texExpression) {
          $element.html(texExpression);
          MathJax.Hub.Queue(["Typeset", MathJax.Hub, $element[0]]);
        });
      }
    ]
  };
});

app.directive('imgField', function() {
  return {
    templateUrl: '/static/ngTemplates/imgField.html',
    restrict: 'E',
    replace: true,
    scope: {
      img: '='
    },
    controller: function($scope, $state, $stateParams) {
      function makeid(length) {
         var result           = '';
         var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
         var charactersLength = characters.length;
         for ( var i = 0; i < length; i++ ) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
         }
         return result;
      }

      $scope.key = makeid(6);

      $scope.reset = function() {
        $scope.img = null;
      }

      $scope.openPicker = function() {
        $('#imgSelector'+$scope.key).click();
      }

      $scope.$watch( 'img' ,function(newValue , oldValue) {
        if (newValue == emptyFile || newValue == undefined || newValue == null) {
          $scope.imgPrev = '/static/images/noImage.png';
          return;
        }

        if (typeof newValue == 'string' && newValue.length >10) {
          $scope.imgPrev = newValue;
          return;
        }

        $scope.reader = new FileReader();
        $scope.reader.onload = function(e) {
          $('#imgPreview'+$scope.key).attr('src', e.target.result);
        }
        $scope.reader.readAsDataURL(newValue);
      })

    },
  };
});



app.directive('tabsStrip', function() {
  return {
    templateUrl: '/static/ngTemplates/tabsStrip.html',
    restrict: 'E',
    replace: true,
    scope: {
      tabs: '=',
      active: '='
    },
    controller: function($scope, $state, $stateParams) {
      $scope.changeTab = function(index) {
        for (var i = 0; i < $scope.tabs.length; i++) {
          $scope.tabs[i].active = false;
        }
        $scope.tabs[index].active = true;
        $scope.active = index;
      }

      $scope.$watch('active', function(newValue, oldValue) {
        $scope.changeTab(newValue);
      })
    },
  };
});

app.directive('commentInput', function() {
  return {
    templateUrl: '/static/ngTemplates/inputWithFile.html',
    restrict: 'E',
    replace: true,
    scope: {
      text: '=',
      doc: '=',
      saveNote: '='
    },
    controller: function($scope, $state, $stateParams) {

      $scope.randomKey = '' + new Date().getTime();

      if ($scope.doc == null || $scope.doc == undefined) {
        $scope.doc = emptyFile;
      }
      if ($scope.text == null || $scope.doc == undefined) {
        $scope.text = '';
      }
      $scope.browseForFile = function() {
        if ($scope.doc.size != 0) {
          $scope.doc = emptyFile;
          return;
        }
        $('#noteEditorFile' + $scope.randomKey).click();
      }

      $scope.$watch('doc', function(newValue, oldValue) {
        // console.log(newValue);
      })
    },
  };
});

app.directive('wizard', function() {
  return {
    templateUrl: '/static/ngTemplates/wizard.html',
    restrict: 'E',
    replace: true,
    scope: {
      active: '=',
      editable: '=',
      steps: '=',
      error: '='
    },
    controller: function($scope, $state, $stateParams) {

      $scope.activeBackup = -2;
      $scope.wizardClicked = function(indx) {
        if ($scope.editable) {
          $scope.active = indx;
          $scope.activeBackup = -2;
        }
      }

      $scope.resetHover = function(indx) {
        if ($scope.editable && $scope.activeBackup != -2) {
          $scope.active = $scope.activeBackup;
          $scope.activeBackup = -2;
        }
      }

      $scope.activateTemp = function(indx) {
        if ($scope.editable) {
          $scope.activeBackup = $scope.active;
          $scope.active = indx;
        }
      }

    },
  };
});

app.directive('breadcrumb', function() {
  return {
    templateUrl: '/static/ngTemplates/breadcrumb.html',
    restrict: 'E',
    replace: true,
    scope: false,
    controller: function($scope, $state, $stateParams) {
      var stateName = $state.current.name;
      $scope.stateParts = stateName.split('.');
      for (key in $stateParams) {
        if (typeof $stateParams[key] != 'undefined' && $stateParams[key] != '' && typeof parseInt($stateParams[key]) != 'number') {
          $scope.stateParts.push($stateParams[key]);
        };
      };
    },
  };
});

app.directive('userField', function() {
  return {
    templateUrl: '/static/ngTemplates/userInputField.html',
    restrict: 'E',
    replace: true,
    scope: {
      user: '=',
      url: '@',
      label: '@',
    },
    controller: function($scope, $state, $http, Flash) {
      $scope.userSearch = function(query) {
        return $http.get($scope.url + '?username__contains=' + query).
        then(function(response) {
          return response.data;
        })
      };
      $scope.getName = function(u) {
        if (typeof u == 'undefined' || u == null) {
          return '';
        }
        return u.first_name + '  ' + u.last_name;
      }
    },
  };
});

app.directive('usersField', function() {
  return {
    templateUrl: '/static/ngTemplates/usersInputField.html',
    restrict: 'E',
    replace: true,
    scope: {
      data: '=',
      url: '@',
      col: '@',
      label: '@',
      viewOnly: '@'
    },
    controller: function($scope, $state, $http, Flash) {
      $scope.d = {
        user: undefined
      };
      if (typeof $scope.col != 'undefined') {
        $scope.showResults = true;
      } else {
        $scope.showResults = false;
      }

      if (typeof $scope.viewOnly != 'undefined') {
        $scope.viewOnly = false;
      }
      // $scope.user = undefined;
      $scope.userSearch = function(query) {
        return $http.get($scope.url + '?username__contains=' + query).
        then(function(response) {
          for (var i = 0; i < response.data.length; i++) {
            if ($scope.data.indexOf(response.data[i]) != -1) {
              response.data.splice(i, 1);
            }
          }
          return response.data;
        })
      };
      $scope.getName = function(u) {
        if (typeof u == 'undefined') {
          return '';
        }
        return u.first_name + '  ' + u.last_name;
      }

      $scope.removeUser = function(index) {
        $scope.data.splice(index, 1);
      }

      $scope.addUser = function() {
        for (var i = 0; i < $scope.data.length; i++) {
          if ($scope.data[i] == $scope.d.user.pk) {
            Flash.create('danger', 'User already a member of this group')
            return;
          }
        }
        $scope.data.push($scope.d.user.pk);
        $scope.d.user = undefined;
      }
    },
  };
});

app.directive('mediaField', function() {
  return {
    templateUrl: '/static/ngTemplates/mediaInputField.html',
    restrict: 'E',
    replace: true,
    scope: {
      data: '=',
      url: '@',
    },
    controller: function($scope, $state, $http, Flash) {
      $scope.form = {
        mediaType: '',
        url: ''
      }
      $scope.switchMediaMode = function(mode) {
        $scope.form.mediaType = mode;
      }

      $scope.getFileName = function(f) {
        var parts = f.split('/');
        return parts[parts.length - 1];
      }

      $scope.removeMedia = function(index) {
        $http({
          method: 'DELETE',
          url: $scope.url + $scope.data[index].pk + '/'
        }).
        then(function(response) {
          $scope.data.splice(index, 1);
        })
      }
      $scope.postMedia = function() {
        var fd = new FormData();
        fd.append('mediaType', $scope.form.mediaType);
        fd.append('link', $scope.form.url);
        if (['doc', 'image', 'video'].indexOf($scope.form.mediaType) != -1 && $scope.form.file != emptyFile) {
          fd.append('attachment', $scope.form.file);
        } else if ($scope.form.url == '') {
          Flash.create('danger', 'No file to attach');
          return;
        }
        url = $scope.url;
        $http({
          method: 'POST',
          url: url,
          data: fd,
          transformRequest: angular.identity,
          headers: {
            'Content-Type': undefined
          }
        }).
        then(function(response) {
          $scope.data.push(response.data);
          $scope.form.file = emptyFile;
          Flash.create('success', response.status + ' : ' + response.statusText);
        }, function(response) {
          Flash.create('danger', response.status + ' : ' + response.statusText);
        });
      }
    },
  };
});

app.directive('genericForm', function() {
  return {
    templateUrl: '/static/ngTemplates/genericForm.html',
    restrict: 'E',
    replace: true,
    scope: {
      template: '=',
      submitFn: '&',
      data: '=',
      formTitle: '=',
      wizard: '=',
      maxPage: '=',
    },
    controller: function($scope, $state) {
      $scope.page = 1;

      $scope.next = function() {
        $scope.page += 1;
        if ($scope.page > $scope.maxPage) {
          $scope.page = $scope.maxPage;
        }
      }
      $scope.prev = function() {
        $scope.page -= 1;
        if ($scope.page < 1) {
          $scope.page = 1;
        }
      }
    },
  };
});


app.directive('messageStrip', function() {
  return {
    templateUrl: '/static/ngTemplates/messageStrip.html',
    restrict: 'E',
    transclude: true,
    replace: true,
    scope: {
      data: '=',
      openChat: '=',
    },
    controller: function($scope, $users) {
      $scope.me = $users.get('mySelf');
      if ($scope.me.pk == $scope.data.originator) {
        $scope.friend = $scope.data.user;
      } else {
        $scope.friend = $scope.data.originator;
      }
      $scope.clicked = function() {
        $scope.data.count = 0;
        $scope.openChat($scope.friend)
      }
    }
  };
});

app.directive('notificationStrip', function() {
  return {
    templateUrl: '/static/ngTemplates/notificationStrip.html',
    restrict: 'E',
    transclude: true,
    replace: true,
    scope: {
      data: '=',
    },
    controller: function($scope, $http, $users, $aside) {
      var parts = $scope.data.shortInfo.split(':');
      // console.log(parts);
      if (typeof parts[1] == 'undefined') {
        $scope.notificationType = 'default';
      } else {
        $scope.notificationType = parts[0];
      }
      // console.log($scope.data);
      // console.log($scope.notificationType);
      var nodeUrl = '/api/social/' + $scope.notificationType + '/'
      if (typeof parts[1] != 'undefined' && $scope.data.originator == 'social') {
        // console.log(nodeUrl + parts[1]);
        $http({
          method: 'GET',
          url: nodeUrl + parts[1] + '/'
        }).
        then(function(response) {
          $scope.friend = response.data.user;
          if ($scope.notificationType == 'postComment') {
            var url = '/api/social/post/' + response.data.parent + '/';
          } else if ($scope.notificationType == 'pictureComment') {
            var url = '/api/social/picture/' + response.data.parent + '/';
          }
          $http({
            method: 'GET',
            url: url
          }).then(function(response) {
            $scope.notificationData = response.data;
            if ($scope.notificationType == 'pictureComment') {
              $http({
                method: 'GET',
                url: '/api/social/album/' + $scope.data.shortInfo.split(':')[3] + '/?user=' + $users.get($scope.notificationData.user).username
              }).
              then(function(response) {
                $scope.objParent = response.data;
              });
            };
          });
        });
      } else if (typeof parts[1] != 'undefined' && $scope.data.originator == 'git') {
        if (parts[0] == 'codeComment') {
          var url = '/api/git/commitNotification/?sha=' + parts[2];
          $http({
            method: 'GET',
            url: url
          }).
          then(function(response) {
            $scope.commit = response.data[0];
          });
          var url = '/api/git/codeComment/' + parts[1] + '/';
          $http({
            method: 'GET',
            url: url
          }).
          then(function(response) {
            $scope.codeComment = response.data;
          });
        }
      };

      $scope.openAlbum = function(position, backdrop, input) {
        $scope.asideState = {
          open: true,
          position: position
        };

        function postClose() {
          $scope.asideState.open = false;
        }

        $aside.open({
          templateUrl: '/static/ngTemplates/app.social.aside.album.html',
          placement: position,
          size: 'lg',
          backdrop: backdrop,
          controller: 'controller.social.aside.picture',
          resolve: {
            input: function() {
              return input;
            }
          }
        }).result.then(postClose, postClose);
      }

      $scope.openPost = function(position, backdrop, input) {
        $scope.asideState = {
          open: true,
          position: position
        };

        function postClose() {
          $scope.asideState.open = false;
        }

        $aside.open({
          templateUrl: '/static/ngTemplates/app.social.aside.post.html',
          placement: position,
          size: 'md',
          backdrop: backdrop,
          controller: 'controller.social.aside.post',
          resolve: {
            input: function() {
              return input;
            }
          }
        }).result.then(postClose, postClose);
      }

      $scope.openCommit = function() {
        $aside.open({
          templateUrl: '/static/ngTemplates/app.GIT.aside.exploreNotification.html',
          position: 'left',
          size: 'xxl',
          backdrop: true,
          resolve: {
            input: function() {
              return $scope.commit;
            }
          },
          controller: 'projectManagement.GIT.exploreNotification',
        })
      }

      $scope.openNotification = function() {
        $http({
          method: 'PATCH',
          url: '/api/PIM/notification/' + $scope.data.pk + '/',
          data: {
            read: true
          }
        }).
        then(function(response) {
          $scope.$parent.notificationClicked($scope.data.pk);
          $scope.data.read = true;
        });
        if ($scope.notificationType == 'postLike' || $scope.notificationType == 'postComment') {
          $scope.openPost('right', true, {
            data: $scope.notificationData,
            onDelete: function() {
              return;
            }
          })
        } else if ($scope.notificationType == 'pictureLike' || $scope.notificationType == 'pictureComment') {
          $scope.openAlbum('right', true, {
            data: $scope.notificationData,
            parent: $scope.objParent,
            onDelete: ""
          })
        } else if ($scope.notificationType == 'codeComment') {
          $scope.openCommit()
        }
      }
    },
  };
});


app.directive('chatWindow', function($users) {
  return {
    templateUrl: '/static/ngTemplates/chatWindow.html',
    restrict: 'E',
    transclude: true,
    replace: true,
    scope: {
      friendUrl: '=',
      pos: '=',
      cancel: '&',
    },
    controller: function($scope, $location, $anchorScroll, $http, $templateCache, $timeout, ngAudio) {
      // console.log($scope.pos);
      $scope.me = $users.get("mySelf");
      $scope.friend = $users.get($scope.friendUrl);
      // console.log($scope.friend);
      $scope.sound = ngAudio.load("static/audio/notification.mp3");

      $scope.isTyping = false;
      $scope.toggle = true;
      $scope.messageToSend = "";
      $scope.status = "N"; // neutral / No action being performed
      $scope.send = function() {
        var msg = angular.copy($scope.messageToSend)
        if (msg != "") {
          $scope.status = "M"; // contains message
          var dataToSend = {
            message: msg,
            user: $scope.friend.pk,
            read: false
          };
          $http({
            method: 'POST',
            data: dataToSend,
            url: '/api/PIM/chatMessage/'
          }).
          then(function(response) {
            $scope.ims.push(response.data)
            $scope.senderIsMe.push(true);
            connection.session.publish('service.chat.' + $scope.friend.username, [$scope.status, response.data.message, $scope.me.username, response.data.pk], {}, {
              acknowledge: true
            }).
            then(function(publication) {});
            $scope.messageToSend = "";
          })
        }
      }; // send function

      $scope.addMessage = function(msg, url) {
        $scope.sound.play();
        $http({
          method: 'PATCH',
          url: '/api/PIM/chatMessage/' + url + '/?mode=',
          data: {
            read: true
          }
        }).
        then(function(response) {
          $scope.ims.push(response.data);
          $scope.senderIsMe.push(false);
        });
      };

      $scope.fetchMessages = function() {
        $scope.method = 'GET';
        $scope.url = '/api/PIM/chatMessageBetween/?other=' + $scope.friend.username;
        $scope.ims = [];
        $scope.imsCount = 0;
        $scope.senderIsMe = [];
        $http({
          method: $scope.method,
          url: $scope.url
        }).
        then(function(response) {
          $scope.imsCount = response.data.length;
          for (var i = 0; i < response.data.length; i++) {
            var im = response.data[i];
            var sender = $users.get(im.originator)
            if (sender.username == $scope.me.username) {
              $scope.senderIsMe.push(true);
            } else {
              $scope.senderIsMe.push(false);
            }
            $scope.ims.push(im);
            // console.log($scope.ims.length);
          }
        });
      };
      $scope.fetchMessages();
      $scope.scroll = function() {
        var $id = $("#scrollArea" + $scope.pos);
        $id.scrollTop($id[0].scrollHeight);
      }
    },
    // attrs is the attrs passed from the main scope
    link: function postLink(scope, element, attrs) {
      scope.$watch('messageToSend', function(newValue, oldValue) {
        // console.log("changing");
        scope.status = "T"; // the sender is typing a message
        if (newValue != "") {
          connection.session.publish('service.chat.' + scope.friend.username, [scope.status, scope.messageToSend, scope.me.username]);
        }
        scope.status = "N";
      }); // watch for the messageTosend
      scope.$watch('ims.length', function() {
        setTimeout(function() {
          scope.scroll();
        }, 500);
      });
      scope.$watch('pos', function(newValue, oldValue) {
        // console.log(newValue);
        scope.location = 30 + newValue * 320;
        // console.log("setting the new position value");
        // console.log();
      });
    } // link
  };
});

app.directive('productCard', function() {
  return {
    templateUrl: '/static/ngTemplates/productCard.html',
    restrict: 'E',
    transclude: true,
    replace: true,
    scope: {
      list: '=',
      // addCart: '='
    },
    controller: function($scope, $state, $http, Flash, $rootScope, $users, $filter) {
      $scope.me = $users.get('mySelf');
      $scope.priceDisplay = false
      $scope.priceDisplay = settings_isPrice;
      $scope.showPrice = false
      if(!$scope.me&&!$scope.priceDisplay){
        $scope.showPrice = false
      }
      else{
        $scope.showPrice = true
      }
      $scope.currency == 'fa-inr'
      $scope.currency = settings_currencySymbol;
      $scope.isHeart = settings_isHeart;

      if ($scope.currency == 'fa-usd'){
        $scope.currencyVal = '$'
      }
      else if ($scope.currency == 'fa-inr'){

        $scope.currencyVal = '₹'
      }
      else{
          $scope.currencyVal = ''
      }

      if ($rootScope.multiStore) {
        $scope.storePK = $rootScope.storepk
      } else {
        $scope.storePK = null
      }
      $scope.prod_var = $scope.list.product_variants;
      $scope.prodVarList = []
      $scope.qtyToAddInit = {
        qty: 1
      }
    $scope.imgData = $scope.list.product.displayPicture
      $scope.getProdVar = function() {
        $scope.selectedProdVar = {
          toWatch: []
        }
        $scope.prodVarList = []

        // $scope.list.product.unit = $filter('getUnit')($scope.list.product.unit);


        if(!$scope.showPrice){
        var str = $filter('convertUnit')($scope.list.product.howMuch, $scope.list.product.unit)
        }
        else{
        var str = $filter('convertUnit')($scope.list.product.howMuch, $scope.list.product.unit) + ' -  '+$scope.currencyVal+' '+ $scope.list.product.discount
        }


        $scope.prodVarList = [{
          str: str,
          qty: $scope.list.product.howMuch,
          minThreshold : $scope.list.product.startingTrashold,
          orderThreshold : $scope.list.product.orderTrashold,
          amnt: $scope.list.product.price,
          // discountedPrice: $scope.list.product.discountedPrice,
          discount :$scope.list.product.discount,
          unit: $scope.list.product.unit,
          sku: $scope.list.product.serialNo,
          specialOffer : $scope.list.product.specialOffer,
          inStock : $scope.list.product.stock
          // disc : (($scope.list.product.price-$scope.list.product.discount).toFixed(2))
        }];


        if ($scope.prod_var) {
          for (var i = 0; i < $scope.prod_var.length; i++) {
            if(!$scope.showPrice){
              str = $filter('convertUnit')($scope.prod_var[i].unitPerpack , $scope.list.product.unit)
            }
            else{
              str = $filter('convertUnit')($scope.prod_var[i].unitPerpack, $scope.prod_var[i].unit) + ' -  '+$scope.currencyVal+' ' + $scope.prod_var[i].discount
            }
            $scope.prodVarList.push({
              pk: $scope.prod_var[i].id,
              str: str,
              qty: $scope.prod_var[i].unitPerpack,
              prodImage: $scope.prod_var[i].prodImage,
              minThreshold : $scope.prod_var[i].startingThreshold,
              orderThreshold: $scope.prod_var[i].orderThreshold,
              discount :$scope.prod_var[i].discount,
              amnt: $scope.prod_var[i].price,
              unit: $scope.prod_var[i].unit,
              sku: $scope.prod_var[i].sku,
              specialOffer : $scope.prod_var[i].specialOffer,
              inStock : $scope.prod_var[i].stock
              // disc:(($scope.prod_var[i].price-$scope.prod_var[i].discount).toFixed(2))
            })
          }
        }

        if ($scope.list.added_cart > 0) {
          // $scope.list.product.serialNo ==
          for (var i = 0; i < $rootScope.inCart.length; i++) {
            for (var j = 0; j < $scope.prodVarList.length; j++) {
              if ($rootScope.inCart[i].prodSku == $scope.prodVarList[j].sku) {
                $scope.selectedProdVar.toWatch = $scope.prodVarList[j];
              }
            }
          }
        } else {
          if ($scope.prodVarList.length>0) {
            var max = $scope.prodVarList.reduce(function (prev, current) {
              return ((prev.amnt - prev.discount) > (current.amnt - current.discount)) ? prev : current
            });
            $scope.selectedProdVar.toWatch = max;
          }
          else{
            $scope.selectedProdVar.toWatch = $scope.prodVarList[0]
          }
        }

        $scope.$watch('selectedProdVar.toWatch', function(newValue, oldValue) {

          $scope.selectedObj = newValue;

          $scope.orderThrList = [$scope.selectedObj.minThreshold]

          // for (var i = 0; i <= $scope.selectedObj.orderThreshold; i++) {
          //   if (i!=0) {
          //     $scope.orderThrList.push(i)
          //   }
          // }

          $scope.qtyToAddInit.qty =  $scope.selectedObj.minThreshold
          if ($scope.selectedObj.prodImage!=undefined) {
            $scope.imgData = $scope.selectedObj.prodImage
          }
          else{
            $scope.imgData = $scope.list.product.displayPicture
          }

          if ($scope.selectedObj.qty != null) {
            $scope.extendedName = $filter('convertUnit')($scope.selectedObj.qty, $scope.selectedObj.unit);
          }

          if (newValue.sku != undefined) {

            if ($scope.me) {
              // console.log('if');
              for (var i = 0; i < $rootScope.inCart.length; i++) {
                if (newValue.sku == $rootScope.inCart[i].prodSku) {
                  $scope.list.added_cart = $rootScope.inCart[i].qty
                  break;
                } else {
                  $scope.list.added_cart = 0
                }
              }
              for (var i = 0; i < $rootScope.inFavourite.length; i++) {
                if ($rootScope.inFavourite[i] != undefined) {
                  if (newValue.sku == $rootScope.inFavourite[i].prodSku) {
                    $scope.list.added_saved = 1
                    break;
                  } else {
                    $scope.list.added_saved = 0
                  }
                }
              }
            } else {
              for (var i = 0; i < $rootScope.addToCart.length; i++) {
                if (newValue.sku == $rootScope.addToCart[i].prodSku) {
                  $scope.list.added_cart = $rootScope.addToCart[i].qty
                  break;
                } else {
                  $scope.list.added_cart = 0
                }
              }
            }

            if (INVENTORY_ENABLED == 'False') {
              $scope.selectedObj.inStock = 1000;
              return;
            }
            else{
                $scope.selectedObj.inStock = newValue.inStock;
            }


            if ($scope.list.product.serialNo == newValue.sku) {
              //
              // for (var i = 0; i < $scope.list.variantsInStoreQty.length; i++) {
              //   if ($scope.list.variantsInStoreQty[i].productVariant == null && $scope.list.variantsInStoreQty[i].store == $scope.storePK) {
              //     $scope.selectedObj.inStock = $scope.list.variantsInStoreQty[i].quantity
              //     break;
              //   } else {
              //     $scope.selectedObj.inStock = 0;
              //   }
              // }

            } else {
              //
              // for (var i = 0; i < $scope.list.variantsInStoreQty.length; i++) {
              //   // console.log($scope.list.variantsInStoreQty[i].productVariant, $scope.selectedObj);
              //   if ($scope.list.variantsInStoreQty[i].productVariant == $scope.selectedObj.pk && $scope.list.variantsInStoreQty[i].store == $scope.storePK) {
              //     $scope.selectedObj.inStock = $scope.list.variantsInStoreQty[i].quantity
              //     // console.log('yes');
              //     break;
              //   } else {
              //     $scope.selectedObj.inStock = 0
              //
              //   }
              // }
              $scope.list.price = newValue.amnt
            }

          }
        })

        if ($scope.prodVarList.length==1) {
          $scope.defaultValue = $scope.prodVarList[0].str
        }

      }

      $scope.getProdVarSize = function() {
        $scope.selectedProdVar = {
          toWatch: []
        }

        $scope.selectedColor = {
          toWatch: ''
        }

        $scope.prodVarList = []
        $scope.prodVarListColors = []

        if ($scope.prod_var) {
          for (var i = 0; i < $scope.prod_var.length; i++) {
            str = $scope.prod_var[i].unitPerpack
            toPush = {
              pk: $scope.prod_var[i].id,
              str: str,
              qty: $scope.prod_var[i].unitPerpack ,
              prodImage: $scope.prod_var[i].prodImage,
              minThreshold: $scope.prod_var[i].startingThreshold,
              orderThreshold: $scope.prod_var[i].orderThreshold,
              discount :$scope.prod_var[i].discount,
              amnt: $scope.prod_var[i].price,
              unit: $scope.prod_var[i].unit,
              sku: $scope.prod_var[i].sku,
              specialOffer : $scope.prod_var[i].specialOffer,
              inStock : $scope.prod_var[i].stock
              // disc: ($scope.prod_var[i].price-(($scope.prod_var[i].price*$scope.prod_var[i].discount)/100)).toFixed(2)
            }

            index = $scope.prodVarList.findIndex(x => x.str == str);
            if (index >= 0) {
              // console.log('already there');
            } else {
              $scope.prodVarList.push(toPush)
            }
          }
          $scope.selectedProdVar.toWatch = $scope.prodVarList[0]
        }

        $scope.$watch('selectedProdVar.toWatch', function(newValue, oldValue) {
          $scope.prodVarListColors = [];
          if (newValue != undefined) {
            for (var i = 0; i < $scope.prod_var.length; i++) {
              if ($scope.prod_var[i].sku.split('&')[0] == $scope.selectedProdVar.toWatch.sku.split('&')[0]) {
                $scope.prodVarListColors.push($scope.prod_var[i])
              }
            }
            if ($scope.prodVarListColors.length >= 0) {
              // console.log('herer');
              $scope.selectedColor.toWatch = $scope.prodVarListColors[0];
            }
          }
        });


        $scope.$watch('selectedColor.toWatch', function(newValue, oldValue) {
          if (newValue != undefined) {
            $scope.selectedObj = {
              pk: newValue.id,
              qty: newValue.unitPerpack ,
              prodImage: newValue.prodImage,
              minThreshold: newValue.minThreshold,
              orderThreshold: newValue.orderThreshold,
              discount :newValue.discount,
              amnt: newValue.price,
              unit: newValue.unit,
              sku: newValue.sku,
              specialOffer :newValue.specialOffer
              // disc: ((newValue.price- newValue.discount).toFixed(2))
            }


            if (newValue.prodDesc != '' && newValue.prodDesc != null) {
              $scope.selectedObj.prodDesc = newValue.prodDesc
            }

            // console.log($scope.selectedObj);

            if ($scope.me) {
              for (var i = 0; i < $rootScope.inCart.length; i++) {
                if ($scope.selectedObj.sku == $rootScope.inCart[i].prodSku) {
                  $scope.list.added_cart = $rootScope.inCart[i].qty
                  break;
                } else {
                  $scope.list.added_cart = 0
                }
              }

              for (var i = 0; i < $rootScope.inFavourite.length; i++) {
                if ($rootScope.inFavourite[i] != undefined) {
                  if ($scope.selectedObj.sku == $rootScope.inFavourite[i].prodSku) {
                    $scope.list.added_saved = 1
                    break;
                  } else {
                    $scope.list.added_saved = 0
                  }
                }
              }

            } else {
              for (var i = 0; i < $rootScope.addToCart.length; i++) {
                if ($scope.selectedObj.sku == $rootScope.addToCart[i].prodSku) {
                  $scope.list.added_cart = $rootScope.addToCart[i].qty
                  break;
                } else {
                  $scope.list.added_cart = 0
                }
              }
            }

            if (INVENTORY_ENABLED == 'False') {
              $scope.selectedObj.inStock = 1000;
              return
            } else {
                $scope.selectedObj.inStock = newValue.stock;

              // for (var i = 0; i < $scope.list.variantsInStoreQty.length; i++) {
              //   if ($scope.list.variantsInStoreQty[i].productVariant == $scope.selectedObj.pk && $scope.list.variantsInStoreQty[i].store == $scope.storePK) {
              //     $scope.selectedObj.inStock = $scope.list.variantsInStoreQty[i].quantity
              //     break;
              //   } else {
              //     $scope.selectedObj.inStock = 0;
              //   }
              // }
            }
          }
        });

      }


      if ($scope.list.product.unit == 'Size and Color') {
        $scope.getProdVarSize()
      } else {
        $scope.getProdVar()
      }

      $scope.openDetails = function(id, name, sku) {
        // console.log($scope.selectedObj.sku);
        // console.log('calling open list ', id, name);
        $state.go('details', {
          name: name,
        })
      }
      // $scope.mainPage = function(){
      // window.location = '/login';
      // }

      function getCookie(cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        // console.log(decodedCookie,'hhhhhhhhhhhhhhhhhhhhhh');
        var ca = decodedCookie.split(';');
        // console.log(ca);
        for (var i = 0; i < ca.length; i++) {
          var c = ca[i];
          while (c.charAt(0) == ' ') {
            c = c.substring(1);
          }
          if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
          }
        }
        return "";
      }

      function setCookie(cname, cvalue, exdays) {
        // console.log('set cookie');
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
      }

      $scope.createCookieDetail = function() {
        if ($scope.qtyToAddInit.qty == '' || $scope.qtyToAddInit.qty <= 0) {
          $scope.qtyToAddInit.qty = $scope.selectedObj.minThreshold
        }
        // console.log($rootScope.addToCart,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        if ($rootScope.addToCart != undefined) {
          for (var i = 0; i < $rootScope.addToCart.length; i++) {
            if ($rootScope.addToCart[i].prodSku == $scope.selectedObj.prodSku) {
              Flash.create("warning", "Product Already in Cart")
              return
            }
          }
        }
        $scope.list.added_cart = $scope.qtyToAddInit.qty
        $scope.item = {
          'productName': $scope.list.product.name,
          'qty': $scope.qtyToAddInit.qty,
          'prodSku': $scope.selectedObj.sku,
          'prod_howMuch': $scope.selectedObj.qty,
          'price': $scope.selectedObj.amnt,
          'unit': $scope.selectedObj.unit,
          'prodPk': $scope.list.pk
        }

        if ($scope.selectedObj.prodDesc) {
          $scope.item.desc = $scope.selectedObj.prodDesc
        }


        detail = getCookie("addToCart");
        $rootScope.addToCart = []
        if (detail != "") {
          // console.log('already there');
          $rootScope.addToCart = JSON.parse(detail)
          document.cookie = encodeURIComponent("addToCart") + "=deleted; expires=" + new Date(0).toUTCString()
        }
        $rootScope.addToCart.push($scope.item)
        setCookie("addToCart", JSON.stringify($rootScope.addToCart), 365);
      }

      $scope.addToCart = function() {
        if ($scope.qtyToAddInit.qty == '' || $scope.qtyToAddInit.qty <= 0) {
          $scope.qtyToAddInit.qty =  $scope.selectedObj.minThreshold
        }
        // console.log($scope.qtyToAddInit.qty,'qtyyyyyyyyyyy');
        $scope.list.added_cart = $scope.qtyToAddInit.qty
        $http({
          method: 'GET',
          url: '/api/ecommerce/cart/?user=' + $scope.me.pk
        }).
        then(function(response) {
          for (var i = 0; i < response.data.length; i++) {
            if (response.data[i].prodSku == $scope.selectedObj.sku) {
              if (response.data[i].typ == 'cart') {
                Flash.create('warning', 'This Product is already in cart');
                return
              } else if (response.data[i].typ == 'favourite') {
                $scope.list.added_saved = 0
                $http({
                  method: 'PATCH',
                  url: '/api/ecommerce/cart/' + response.data[i].pk + '/',
                  data: {
                    qty: $scope.qtyToAddInit.qty,
                    typ: 'cart'
                  }
                }).
                then(function(response) {
                  Flash.create('success', 'Product added to cart');
                  $rootScope.inFavourite.splice(i, 1)
                  $rootScope.inCart.push(response.data);
                })
                response.data[i].typ = 'cart'
                return
              }
            }
          }
          dataToSend = {
            product: $scope.list.pk,
            user: getPK($scope.me.url),
            qty: $scope.qtyToAddInit.qty,
            typ: 'cart',
            prodSku: $scope.selectedObj.sku,
          }
          if ($scope.selectedObj.prodDesc) {
            dataToSend.desc = $scope.selectedObj.prodDesc
          }

          $http({
            method: 'POST',
            url: '/api/ecommerce/cart/',
            data: dataToSend
          }).
          then(function(response) {
            Flash.create('success', 'Product added in cart');
            // console.log(response.data);
            // var prod_variants = response.data.product.product_variants
            // for (var i = 0; i < prod_variants.length; i++) {
            //   if (prod_variants[i].sku == response.data.prodSku) {
            //     response.data.prod_var = prod_variants[i]
            //   }
            // }
            $rootScope.inCart.push(response.data);
            // console.log(response.data);
          })
        })
      }
      $scope.wishlist = function() {
        $http({
          method: 'GET',
          url: '/api/ecommerce/cart/?user=' + $scope.me.pk
        }).
        then(function(response) {
          for (var i = 0; i < response.data.length; i++) {
            // console.log('in cart', response.data[i].product.pk, $scope.list.pk);
            if (response.data[i].prodSku == $scope.selectedObj.sku) {
              if (response.data[i].typ == 'favourite') {
                $scope.list.added_saved = 0
                $http({
                  method: 'DELETE',
                  url: '/api/ecommerce/cart/' + response.data[i].pk + '/',
                }).
                then(function(response) {
                  Flash.create('success', 'Removed From Wishlist');
                  $rootScope.inFavourite.splice(i, 1)

                })
                return
              }

              if (response.data[i].typ == 'cart') {
                $scope.list.added_saved = 0
                $http({
                  method: 'PATCH',
                  url: '/api/ecommerce/cart/' + response.data[i].pk + '/',
                  data:{typ: 'favourite'}
                }).
                then(function(response) {
                  Flash.create('success', 'Added in Wishlist');
                  $scope.list.added_cart = 0;
                  $scope.list.added_saved++;
                  $rootScope.inCart.splice(i, 1)
                  $rootScope.inFavourite.push(response.data)
                })
                return
              }


            }
          }
          $scope.list.added_saved++
            dataToSend = {
              product: $scope.list.pk,
              user: getPK($scope.me.url),
              // qty: 1,
              typ: 'favourite',
              prodSku: $scope.selectedObj.sku
            }

            if ($scope.selectedObj.prodDesc) {
              dataToSend.desc = $scope.selectedObj.prodDesc
            }


          $http({
            method: 'POST',
            url: '/api/ecommerce/cart/',
            data: dataToSend
          }).
          then(function(response) {
            $rootScope.inFavourite.push(response.data)
            Flash.create('success', 'Product added in Wishlist');
            return
          })
        })
        //
        //
      }

      $scope.increment = function() {
        for (var i = 0; i < $rootScope.inCart.length; i++) {
          if ($rootScope.inCart[i].prodSku == $scope.selectedObj.sku) {

            if ($rootScope.inCart[i].typ == 'cart') {
              // if ($rootScope.inCart[i].prodSku!=$scope.selectedObj.sku) {
              //   Flash.create('warning' , 'You cant buy product and combo together')
              //   return
              // }
              // console.log($rootScope.inCart[i].qty,$scope.selectedObj.orderThreshold);
              if ($rootScope.inCart[i].qty<$scope.selectedObj.orderThreshold) {
                $rootScope.inCart[i].qty = $rootScope.inCart[i].qty + 1;
              }
              else{
                Flash.create('warning','You cannot order more than '+String($rootScope.inCart[i].qty))
                return

              }
              // console.log($rootScope.inCart);
              $http({
                method: 'PATCH',
                url: '/api/ecommerce/cart/' + $rootScope.inCart[i].pk + '/',
                data: {
                  qty: $rootScope.inCart[i].qty
                }
              }).
              then(function(response) {

              })
            }
          }
        }
        $scope.list.added_cart++
          $scope.qtyToAddInit.qty = $scope.list.added_cart
      }
      $scope.decrement = function() {
        $scope.list.added_cart--
        $scope.qtyToAddInit.qty = $scope.list.added_cart
        for (var i = 0; i < $rootScope.inCart.length; i++) {
          if ($rootScope.inCart[i].prodSku == $scope.selectedObj.sku) {
            if ($rootScope.inCart[i].typ == 'cart') {
              if ($scope.list.added_cart == 0||$scope.list.added_cart<$scope.selectedObj.minThreshold) {
                $rootScope.inCart[i].qty = 0;
                $http({
                  method: 'DELETE',
                  url: '/api/ecommerce/cart/' + $rootScope.inCart[i].pk + '/',
                }).
                then(function(response) {
                  Flash.create('success', 'Removed From Cart');
                  $scope.qtyToAddInit.qty = $scope.selectedObj.minThreshold

                })
                $rootScope.inCart.splice(i, 1)
                $scope.list.added_saved = 0
                $scope.list.added_cart = 0
              } else {
                $rootScope.inCart[i].qty = $rootScope.inCart[i].qty - 1;
                $http({
                  method: 'PATCH',
                  url: '/api/ecommerce/cart/' + $rootScope.inCart[i].pk + '/',
                  data: {
                    qty: $rootScope.inCart[i].qty
                  }
                }).
                then(function(response) {

                })

              }
            }
          }
        }

      }

      $scope.incrementCookie = function() {


        if ($scope.list.added_cart<$scope.selectedObj.orderThreshold) {
              $scope.list.added_cart++
        }
        else{
          Flash.create('warning','You cannot order more than '+String($scope.list.added_cart))
          return

        }
          $scope.qtyToAddInit.qty = $scope.list.added_cart
        for (var i = 0; i < $rootScope.addToCart.length; i++) {
          if ($rootScope.addToCart[i].prodSku == $scope.selectedObj.sku) {
            $rootScope.addToCart[i].qty = $rootScope.addToCart[i].qty + 1
            setCookie("addToCart", JSON.stringify($rootScope.addToCart), 365);
          }
        }
      }

      $scope.decrementCookie = function() {
        $scope.list.added_cart--
          $scope.qtyToAddInit.qty = $scope.list.added_cart
        for (var i = 0; i < $rootScope.addToCart.length; i++) {
          if ($rootScope.addToCart[i].prodSku == $scope.selectedObj.sku) {
            // $rootScope.addToCart[i].qty = $rootScope.addToCart[i].qty-1
            // setCookie("addToCart", JSON.stringify($rootScope.addToCart) , 365);
            console.log($scope.list.added_cart,$scope.selectedObj.minThreshold,'ppppppppppp');
            if ($scope.list.added_cart == 0||$scope.list.added_cart<$scope.selectedObj.minThreshold) {
              setCookie("addToCart", "", -1, '/');
              $rootScope.addToCart.splice(i, 1);
              setCookie("addToCart", JSON.stringify($rootScope.addToCart), 365);
              $scope.qtyToAddInit.qty = $scope.selectedObj.minThreshold
              $scope.list.added_cart = 0
              return
            } else {
              $rootScope.addToCart[i].qty = 0
              setCookie("addToCart", JSON.stringify($rootScope.addToCart), 365);
              return
            }
          }

        }
      }

      // $scope.updateCookieDetail=function(indx, value) {
      //   console.log(productId, value)
      //   if(value=="increase"){
      //     $rootScope.addToCart[indx].qty++
      //   }
      //    if(value=="decrease"){
      //     $rootScope.addToCart[indx].qty--
      //   }
      //   setCookie("addToCart", JSON.stringify($rootScope.addToCart) , 365);
      // }


    },
  };
});
app.directive('productCards', function() {
  return {
    templateUrl: '/static/ngTemplates/productCards.html',
    restrict: 'E',
    transclude: true,
    replace: true,
    scope: {
      list: '=',
      // addCart: '='
      ids: '=',
    },
    controller: function($scope, $state, $http, Flash, $rootScope, $users, $filter) {
      $scope.curr_state = $state.current.name
      $scope.me = $users.get('mySelf');
      $scope.priceDisplay = false
      // $scope.priceDisplay = settings_isPrice;
      $scope.showPrice = false
      if(!$scope.me&&!$scope.priceDisplay){
        $scope.showPrice = false
      }
      else{
        $scope.showPrice = true
      }
      $scope.currency = 'fa-inr'
      // $scope.currency = settings_currencySymbol;
      // $scope.isHeart = settings_isHeart;

      if ($scope.currency == 'fa-usd'){
        $scope.currencyVal = '$'
      }
      else if ($scope.currency == 'fa-inr'){

        $scope.currencyVal = '₹'
      }
      else{
          $scope.currencyVal = ''
      }
      if ($rootScope.multiStore) {
        $scope.storePK = $rootScope.storepk
      } else {
        $scope.storePK = null
      }
      var state = $state.current.url;
      if (isvendor == 'True' && state=='/') {
        $scope.mode = 'edit';
      }



      $scope.deleteproductingroup = function(prodpk,grouppk){
        $http({
          url: '/api/POS/deletegroupprodview/?pk='+grouppk+'&product='+prodpk+'&store='+STORE_PK+'&grpdelete=prod',
          method : 'DELETE'
        }).then(function(response) {
          $rootScope.fetchallproducts();
        });

      }




        // if ($scope.me) {
        //   if ($scope.me.is_superuser) {
        //     $scope.admin_edit_button = true
        //   }
        //   else {
        //     $scope.admin_edit_button = false
        //   }
        // }






    //   $scope.prod_var = $scope.list.product_variants;
    //   $scope.prodVarList = []
    //   $scope.qtyToAddInit = {
    //     qty: 1
    //   }
    // $scope.imgData = $scope.list.product.displayPicture
    //   $scope.getProdVar = function() {
    //     $scope.selectedProdVar = {
    //       toWatch: []
    //     }
    //     $scope.prodVarList = []
    //
    //     // $scope.list.product.unit = $filter('getUnit')($scope.list.product.unit);
    //
    //
    //     if(!$scope.showPrice){
    //     var str = $filter('convertUnit')($scope.list.product.howMuch, $scope.list.product.unit)
    //     }
    //     else{
    //     var str = $filter('convertUnit')($scope.list.product.howMuch, $scope.list.product.unit) + ' -  '+$scope.currencyVal+' '+ $scope.list.product.discount
    //     }
    //
    //
    //     $scope.prodVarList = [{
    //       str: str,
    //       qty: $scope.list.product.howMuch,
    //       minThreshold : $scope.list.product.startingTrashold,
    //       orderThreshold : $scope.list.product.orderTrashold,
    //       amnt: $scope.list.product.price,
    //       // discountedPrice: $scope.list.product.discountedPrice,
    //       discount :$scope.list.product.discount,
    //       unit: $scope.list.product.unit,
    //       sku: $scope.list.product.serialNo,
    //       specialOffer : $scope.list.product.specialOffer,
    //       inStock : $scope.list.product.stock
    //       // disc : (($scope.list.product.price-$scope.list.product.discount).toFixed(2))
    //     }];
    //
    //
    //     if ($scope.prod_var) {
    //       for (var i = 0; i < $scope.prod_var.length; i++) {
    //         if(!$scope.showPrice){
    //           str = $filter('convertUnit')($scope.prod_var[i].unitPerpack , $scope.list.product.unit)
    //         }
    //         else{
    //           str = $filter('convertUnit')($scope.prod_var[i].unitPerpack, $scope.prod_var[i].unit) + ' -  '+$scope.currencyVal+' ' + $scope.prod_var[i].discount
    //         }
    //         $scope.prodVarList.push({
    //           pk: $scope.prod_var[i].id,
    //           str: str,
    //           qty: $scope.prod_var[i].unitPerpack,
    //           prodImage: $scope.prod_var[i].prodImage,
    //           minThreshold : $scope.prod_var[i].startingThreshold,
    //           orderThreshold: $scope.prod_var[i].orderThreshold,
    //           discount :$scope.prod_var[i].discount,
    //           amnt: $scope.prod_var[i].price,
    //           unit: $scope.prod_var[i].unit,
    //           sku: $scope.prod_var[i].sku,
    //           specialOffer : $scope.prod_var[i].specialOffer,
    //           inStock : $scope.prod_var[i].stock
    //           // disc:(($scope.prod_var[i].price-$scope.prod_var[i].discount).toFixed(2))
    //         })
    //       }
    //     }
    //
    //     if ($scope.list.added_cart > 0) {
    //
    //       for (var i = 0; i < $rootScope.inCart.length; i++) {
    //         for (var j = 0; j < $scope.prodVarList.length; j++) {
    //           if ($rootScope.inCart[i].prodSku == $scope.prodVarList[j].sku) {
    //             $scope.selectedProdVar.toWatch = $scope.prodVarList[j];
    //           }
    //         }
    //       }
    //     } else {
    //       if ($scope.prodVarList.length>0) {
    //         var max = $scope.prodVarList.reduce(function (prev, current) {
    //           return ((prev.amnt - prev.discount) > (current.amnt - current.discount)) ? prev : current
    //         });
    //         $scope.selectedProdVar.toWatch = max;
    //       }
    //       else{
    //         $scope.selectedProdVar.toWatch = $scope.prodVarList[0]
    //       }
    //     }

      //   $scope.$watch('selectedProdVar.toWatch', function(newValue, oldValue) {
      //
      //     $scope.selectedObj = newValue;
      //
      //     $scope.orderThrList = [$scope.selectedObj.minThreshold]
      //
      //     // for (var i = 0; i <= $scope.selectedObj.orderThreshold; i++) {
      //     //   if (i!=0) {
      //     //     $scope.orderThrList.push(i)
      //     //   }
      //     // }
      //
      //     $scope.qtyToAddInit.qty =  $scope.selectedObj.minThreshold
      //     if ($scope.selectedObj.prodImage!=undefined) {
      //       $scope.imgData = $scope.selectedObj.prodImage
      //     }
      //     else{
      //       $scope.imgData = $scope.list.product.displayPicture
      //     }
      //
      //     if ($scope.selectedObj.qty != null) {
      //       $scope.extendedName = $filter('convertUnit')($scope.selectedObj.qty, $scope.selectedObj.unit);
      //     }
      //
      //     if (newValue.sku != undefined) {
      //
      //       if ($scope.me) {
      //         // console.log('if');
      //         for (var i = 0; i < $rootScope.inCart.length; i++) {
      //           if (newValue.sku == $rootScope.inCart[i].prodSku) {
      //             $scope.list.added_cart = $rootScope.inCart[i].qty
      //             break;
      //           } else {
      //             $scope.list.added_cart = 0
      //           }
      //         }
      //         for (var i = 0; i < $rootScope.inFavourite.length; i++) {
      //           if ($rootScope.inFavourite[i] != undefined) {
      //             if (newValue.sku == $rootScope.inFavourite[i].prodSku) {
      //               $scope.list.added_saved = 1
      //               break;
      //             } else {
      //               $scope.list.added_saved = 0
      //             }
      //           }
      //         }
      //       } else {
      //         for (var i = 0; i < $rootScope.addToCart.length; i++) {
      //           if (newValue.sku == $rootScope.addToCart[i].prodSku) {
      //             $scope.list.added_cart = $rootScope.addToCart[i].qty
      //             break;
      //           } else {
      //             $scope.list.added_cart = 0
      //           }
      //         }
      //       }
      //
      //       if (INVENTORY_ENABLED == 'False') {
      //         $scope.selectedObj.inStock = 1000;
      //         return;
      //       }
      //       else{
      //           $scope.selectedObj.inStock = newValue.inStock;
      //       }
      //
      //
      //       if ($scope.list.product.serialNo == newValue.sku) {
      //
      //       } else {
      //         $scope.list.price = newValue.amnt
      //       }
      //
      //     }
      //   })
      //
      //   if ($scope.prodVarList.length==1) {
      //     $scope.defaultValue = $scope.prodVarList[0].str
      //   }
      //
      // }
      //
      // $scope.getProdVarSize = function() {
      //   $scope.selectedProdVar = {
      //     toWatch: []
      //   }
      //
      //   $scope.selectedColor = {
      //     toWatch: ''
      //   }
      //
      //   $scope.prodVarList = []
      //   $scope.prodVarListColors = []
      //
      //   if ($scope.prod_var) {
      //     for (var i = 0; i < $scope.prod_var.length; i++) {
      //       str = $scope.prod_var[i].unitPerpack
      //       toPush = {
      //         pk: $scope.prod_var[i].id,
      //         str: str,
      //         qty: $scope.prod_var[i].unitPerpack ,
      //         prodImage: $scope.prod_var[i].prodImage,
      //         minThreshold: $scope.prod_var[i].startingThreshold,
      //         orderThreshold: $scope.prod_var[i].orderThreshold,
      //         discount :$scope.prod_var[i].discount,
      //         amnt: $scope.prod_var[i].price,
      //         unit: $scope.prod_var[i].unit,
      //         sku: $scope.prod_var[i].sku,
      //         specialOffer : $scope.prod_var[i].specialOffer,
      //         inStock : $scope.prod_var[i].stock
      //         // disc: ($scope.prod_var[i].price-(($scope.prod_var[i].price*$scope.prod_var[i].discount)/100)).toFixed(2)
      //       }
      //
      //       index = $scope.prodVarList.findIndex(x => x.str == str);
      //       if (index >= 0) {
      //         // console.log('already there');
      //       } else {
      //         $scope.prodVarList.push(toPush)
      //       }
      //     }
      //     $scope.selectedProdVar.toWatch = $scope.prodVarList[0]
      //   }
      //
      //   $scope.$watch('selectedProdVar.toWatch', function(newValue, oldValue) {
      //     $scope.prodVarListColors = [];
      //     if (newValue != undefined) {
      //       for (var i = 0; i < $scope.prod_var.length; i++) {
      //         if ($scope.prod_var[i].sku.split('&')[0] == $scope.selectedProdVar.toWatch.sku.split('&')[0]) {
      //           $scope.prodVarListColors.push($scope.prod_var[i])
      //         }
      //       }
      //       if ($scope.prodVarListColors.length >= 0) {
      //         // console.log('herer');
      //         $scope.selectedColor.toWatch = $scope.prodVarListColors[0];
      //       }
      //     }
      //   });

      //
      //   $scope.$watch('selectedColor.toWatch', function(newValue, oldValue) {
      //     if (newValue != undefined) {
      //       $scope.selectedObj = {
      //         pk: newValue.id,
      //         qty: newValue.unitPerpack ,
      //         prodImage: newValue.prodImage,
      //         minThreshold: newValue.minThreshold,
      //         orderThreshold: newValue.orderThreshold,
      //         discount :newValue.discount,
      //         amnt: newValue.price,
      //         unit: newValue.unit,
      //         sku: newValue.sku,
      //         specialOffer :newValue.specialOffer
      //         // disc: ((newValue.price- newValue.discount).toFixed(2))
      //       }
      //
      //
      //       if (newValue.prodDesc != '' && newValue.prodDesc != null) {
      //         $scope.selectedObj.prodDesc = newValue.prodDesc
      //       }
      //
      //       // console.log($scope.selectedObj);
      //
      //       if ($scope.me) {
      //         for (var i = 0; i < $rootScope.inCart.length; i++) {
      //           if ($scope.selectedObj.sku == $rootScope.inCart[i].prodSku) {
      //             $scope.list.added_cart = $rootScope.inCart[i].qty
      //             break;
      //           } else {
      //             $scope.list.added_cart = 0
      //           }
      //         }
      //
      //         for (var i = 0; i < $rootScope.inFavourite.length; i++) {
      //           if ($rootScope.inFavourite[i] != undefined) {
      //             if ($scope.selectedObj.sku == $rootScope.inFavourite[i].prodSku) {
      //               $scope.list.added_saved = 1
      //               break;
      //             } else {
      //               $scope.list.added_saved = 0
      //             }
      //           }
      //         }
      //
      //       } else {
      //         for (var i = 0; i < $rootScope.addToCart.length; i++) {
      //           if ($scope.selectedObj.sku == $rootScope.addToCart[i].prodSku) {
      //             $scope.list.added_cart = $rootScope.addToCart[i].qty
      //             break;
      //           } else {
      //             $scope.list.added_cart = 0
      //           }
      //         }
      //       }
      //
      //       if (INVENTORY_ENABLED == 'False') {
      //         $scope.selectedObj.inStock = 1000;
      //         return
      //       } else {
      //           $scope.selectedObj.inStock = newValue.stock;
      //
      //         // for (var i = 0; i < $scope.list.variantsInStoreQty.length; i++) {
      //         //   if ($scope.list.variantsInStoreQty[i].productVariant == $scope.selectedObj.pk && $scope.list.variantsInStoreQty[i].store == $scope.storePK) {
      //         //     $scope.selectedObj.inStock = $scope.list.variantsInStoreQty[i].quantity
      //         //     break;
      //         //   } else {
      //         //     $scope.selectedObj.inStock = 0;
      //         //   }
      //         // }
      //       }
      //     }
      //   });
      //
      // }

      //
      // if ($scope.list.product.unit == 'Size and Color') {
      //   $scope.getProdVarSize()
      // } else {
      //   $scope.getProdVar()
      // }

      $scope.openDetails = function(id,name,vid) {
        console.log('herrrrrrrrr',id,name,vid);
        $state.go('details', {
          id:id,
          name: name,
          vid:vid
        })
      }
      // $scope.mainPage = function(){
      // window.location = '/login';
      // }

      function getCookie(cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        // console.log(decodedCookie,'hhhhhhhhhhhhhhhhhhhhhh');
        var ca = decodedCookie.split(';');
        // console.log(ca);
        for (var i = 0; i < ca.length; i++) {
          var c = ca[i];
          while (c.charAt(0) == ' ') {
            c = c.substring(1);
          }
          if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
          }
        }
        return "";
      }

      function setCookie(cname, cvalue, exdays) {
        // console.log('set cookie');
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
      }

      $scope.createCookieDetail = function() {
        if ($scope.qtyToAddInit.qty == '' || $scope.qtyToAddInit.qty <= 0) {
          $scope.qtyToAddInit.qty = $scope.selectedObj.minThreshold
        }
        // console.log($rootScope.addToCart,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        if ($rootScope.addToCart != undefined) {
          for (var i = 0; i < $rootScope.addToCart.length; i++) {
            if ($rootScope.addToCart[i].prodSku == $scope.selectedObj.prodSku) {
              Flash.create("warning", "Product Already in Cart")
              return
            }
          }
        }
        $scope.list.added_cart = $scope.qtyToAddInit.qty
        $scope.item = {
          'productName': $scope.list.product.name,
          'qty': $scope.qtyToAddInit.qty,
          'prodSku': $scope.selectedObj.sku,
          'prod_howMuch': $scope.selectedObj.qty,
          'price': $scope.selectedObj.amnt,
          'unit': $scope.selectedObj.unit,
          'prodPk': $scope.list.pk
        }

        if ($scope.selectedObj.prodDesc) {
          $scope.item.desc = $scope.selectedObj.prodDesc
        }


        detail = getCookie("addToCart");
        $rootScope.addToCart = []
        if (detail != "") {
          // console.log('already there');
          $rootScope.addToCart = JSON.parse(detail)
          document.cookie = encodeURIComponent("addToCart") + "=deleted; expires=" + new Date(0).toUTCString()
        }
        $rootScope.addToCart.push($scope.item)
        setCookie("addToCart", JSON.stringify($rootScope.addToCart), 365);
      }

      $scope.addToCart = function() {
        if ($scope.qtyToAddInit.qty == '' || $scope.qtyToAddInit.qty <= 0) {
          $scope.qtyToAddInit.qty =  $scope.selectedObj.minThreshold
        }
        // console.log($scope.qtyToAddInit.qty,'qtyyyyyyyyyyy');
        $scope.list.added_cart = $scope.qtyToAddInit.qty
        $http({
          method: 'GET',
          url: '/api/ecommerce/cart/?user=' + $scope.me.pk
        }).
        then(function(response) {
          for (var i = 0; i < response.data.length; i++) {
            if (response.data[i].prodSku == $scope.selectedObj.sku) {
              if (response.data[i].typ == 'cart') {
                Flash.create('warning', 'This Product is already in cart');
                return
              } else if (response.data[i].typ == 'favourite') {
                $scope.list.added_saved = 0
                $http({
                  method: 'PATCH',
                  url: '/api/ecommerce/cart/' + response.data[i].pk + '/',
                  data: {
                    qty: $scope.qtyToAddInit.qty,
                    typ: 'cart'
                  }
                }).
                then(function(response) {
                  Flash.create('success', 'Product added to cart');
                  $rootScope.inFavourite.splice(i, 1)
                  $rootScope.inCart.push(response.data);
                })
                response.data[i].typ = 'cart'
                return
              }
            }
          }
          dataToSend = {
            product: $scope.list.pk,
            user: getPK($scope.me.url),
            qty: $scope.qtyToAddInit.qty,
            typ: 'cart',
            prodSku: $scope.selectedObj.sku,
          }
          if ($scope.selectedObj.prodDesc) {
            dataToSend.desc = $scope.selectedObj.prodDesc
          }

          $http({
            method: 'POST',
            url: '/api/ecommerce/cart/',
            data: dataToSend
          }).
          then(function(response) {
            Flash.create('success', 'Product added in cart');
            // console.log(response.data);
            // var prod_variants = response.data.product.product_variants
            // for (var i = 0; i < prod_variants.length; i++) {
            //   if (prod_variants[i].sku == response.data.prodSku) {
            //     response.data.prod_var = prod_variants[i]
            //   }
            // }
            $rootScope.inCart.push(response.data);
            // console.log(response.data);
          })
        })
      }
      $scope.wishlist = function() {
        $http({
          method: 'GET',
          url: '/api/ecommerce/cart/?user=' + $scope.me.pk
        }).
        then(function(response) {
          for (var i = 0; i < response.data.length; i++) {
            // console.log('in cart', response.data[i].product.pk, $scope.list.pk);
            if (response.data[i].prodSku == $scope.selectedObj.sku) {
              if (response.data[i].typ == 'favourite') {
                $scope.list.added_saved = 0
                $http({
                  method: 'DELETE',
                  url: '/api/ecommerce/cart/' + response.data[i].pk + '/',
                }).
                then(function(response) {
                  Flash.create('success', 'Removed From Wishlist');
                  $rootScope.inFavourite.splice(i, 1)

                })
                return
              }

              if (response.data[i].typ == 'cart') {
                $scope.list.added_saved = 0
                $http({
                  method: 'PATCH',
                  url: '/api/ecommerce/cart/' + response.data[i].pk + '/',
                  data:{typ: 'favourite'}
                }).
                then(function(response) {
                  Flash.create('success', 'Added in Wishlist');
                  $scope.list.added_cart = 0;
                  $scope.list.added_saved++;
                  $rootScope.inCart.splice(i, 1)
                  $rootScope.inFavourite.push(response.data)
                })
                return
              }


            }
          }
          $scope.list.added_saved++
            dataToSend = {
              product: $scope.list.pk,
              user: getPK($scope.me.url),
              // qty: 1,
              typ: 'favourite',
              prodSku: $scope.selectedObj.sku
            }

            if ($scope.selectedObj.prodDesc) {
              dataToSend.desc = $scope.selectedObj.prodDesc
            }


          $http({
            method: 'POST',
            url: '/api/ecommerce/cart/',
            data: dataToSend
          }).
          then(function(response) {
            $rootScope.inFavourite.push(response.data)
            Flash.create('success', 'Product added in Wishlist');
            return
          })
        })
        //
        //
      }

      $scope.increment = function() {
        for (var i = 0; i < $rootScope.inCart.length; i++) {
          if ($rootScope.inCart[i].prodSku == $scope.selectedObj.sku) {

            if ($rootScope.inCart[i].typ == 'cart') {
              // if ($rootScope.inCart[i].prodSku!=$scope.selectedObj.sku) {
              //   Flash.create('warning' , 'You cant buy product and combo together')
              //   return
              // }
              // console.log($rootScope.inCart[i].qty,$scope.selectedObj.orderThreshold);
              if ($rootScope.inCart[i].qty<$scope.selectedObj.orderThreshold) {
                $rootScope.inCart[i].qty = $rootScope.inCart[i].qty + 1;
              }
              else{
                Flash.create('warning','You cannot order more than '+String($rootScope.inCart[i].qty))
                return

              }
              // console.log($rootScope.inCart);
              $http({
                method: 'PATCH',
                url: '/api/ecommerce/cart/' + $rootScope.inCart[i].pk + '/',
                data: {
                  qty: $rootScope.inCart[i].qty
                }
              }).
              then(function(response) {

              })
            }
          }
        }
        $scope.list.added_cart++
          $scope.qtyToAddInit.qty = $scope.list.added_cart
      }
      $scope.decrement = function() {
        $scope.list.added_cart--
        $scope.qtyToAddInit.qty = $scope.list.added_cart
        for (var i = 0; i < $rootScope.inCart.length; i++) {
          if ($rootScope.inCart[i].prodSku == $scope.selectedObj.sku) {
            if ($rootScope.inCart[i].typ == 'cart') {
              if ($scope.list.added_cart == 0||$scope.list.added_cart<$scope.selectedObj.minThreshold) {
                $rootScope.inCart[i].qty = 0;
                $http({
                  method: 'DELETE',
                  url: '/api/ecommerce/cart/' + $rootScope.inCart[i].pk + '/',
                }).
                then(function(response) {
                  Flash.create('success', 'Removed From Cart');
                  $scope.qtyToAddInit.qty = $scope.selectedObj.minThreshold

                })
                $rootScope.inCart.splice(i, 1)
                $scope.list.added_saved = 0
                $scope.list.added_cart = 0
              } else {
                $rootScope.inCart[i].qty = $rootScope.inCart[i].qty - 1;
                $http({
                  method: 'PATCH',
                  url: '/api/ecommerce/cart/' + $rootScope.inCart[i].pk + '/',
                  data: {
                    qty: $rootScope.inCart[i].qty
                  }
                }).
                then(function(response) {

                })

              }
            }
          }
        }

      }

      $scope.incrementCookie = function() {


        if ($scope.list.added_cart<$scope.selectedObj.orderThreshold) {
              $scope.list.added_cart++
        }
        else{
          Flash.create('warning','You cannot order more than '+String($scope.list.added_cart))
          return

        }
          $scope.qtyToAddInit.qty = $scope.list.added_cart
        for (var i = 0; i < $rootScope.addToCart.length; i++) {
          if ($rootScope.addToCart[i].prodSku == $scope.selectedObj.sku) {
            $rootScope.addToCart[i].qty = $rootScope.addToCart[i].qty + 1
            setCookie("addToCart", JSON.stringify($rootScope.addToCart), 365);
          }
        }
      }

      $scope.decrementCookie = function() {
        $scope.list.added_cart--
          $scope.qtyToAddInit.qty = $scope.list.added_cart
        for (var i = 0; i < $rootScope.addToCart.length; i++) {
          if ($rootScope.addToCart[i].prodSku == $scope.selectedObj.sku) {
            // $rootScope.addToCart[i].qty = $rootScope.addToCart[i].qty-1
            // setCookie("addToCart", JSON.stringify($rootScope.addToCart) , 365);
            console.log($scope.list.added_cart,$scope.selectedObj.minThreshold,'ppppppppppp');
            if ($scope.list.added_cart == 0||$scope.list.added_cart<$scope.selectedObj.minThreshold) {
              setCookie("addToCart", "", -1, '/');
              $rootScope.addToCart.splice(i, 1);
              setCookie("addToCart", JSON.stringify($rootScope.addToCart), 365);
              $scope.qtyToAddInit.qty = $scope.selectedObj.minThreshold
              $scope.list.added_cart = 0
              return
            } else {
              $rootScope.addToCart[i].qty = 0
              setCookie("addToCart", JSON.stringify($rootScope.addToCart), 365);
              return
            }
          }

        }
      }

      // $scope.updateCookieDetail=function(indx, value) {
      //   console.log(productId, value)
      //   if(value=="increase"){
      //     $rootScope.addToCart[indx].qty++
      //   }
      //    if(value=="decrease"){
      //     $rootScope.addToCart[indx].qty--
      //   }
      //   setCookie("addToCart", JSON.stringify($rootScope.addToCart) , 365);
      // }
    },
    };
});
