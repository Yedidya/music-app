(function () {
  "use strict";

  angular.module("app").controller("songsCtrl", function($scope, $http){

    $http.get("/api/v1/users.json").then(function (response) {
      $scope.users = response.data;
    });

  });
})();