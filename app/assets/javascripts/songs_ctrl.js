(function () {
  "use strict";

  angular.module("app").controller("songsCtrl", function($scope, $http){

    $http.get("/api/v1/users.json").then(function (response) {
      $scope.users = response.data;
    });

    $scope.init = function(songId){
      $scope.songId = songId;
      $http.get("/api/v1/team_members/" + $scope.songId + ".json").then(function (response) {
        $scope.teamMembers = response.data;
      });
    };

    $scope.color = function(panel) {
      console.log(panel);
    }
    
  });
})();