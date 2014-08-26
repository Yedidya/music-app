(function (){
  "use strict";

  angular.module("app").controller("commentsCtrl", function($scope, $http){
    $scope.test = "Testing";
    $http.get('/api/comments').then(function(response){
      $scope.comments = response.data; 
    });

    $scope.addComments = function (comment) {
      $scope.comments.push(comment);
      $http.post('/api/comments', { comment: comment}).
      then(function (response){
        console.log(response);
      }, function (error) {
        $scope.error = error.statusText;
        console.log(error.status);
      });
    };
  });
})();