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
    };

    $scope.loadComments = function(versionId, currentUserId) {
      $scope.currentVersionId = versionId;
      $scope.currentUserId = currentUserId;
      $http.get("/api/v1/versions/" + versionId + "/comments.json").then(function (response) {
      $scope.comments = response.data;
      console.log($scope.comments)
      });
    };

    $scope.addComment = function(comment) {
      $http.post("/api/v1/versions/" + $scope.currentVersionId + "/comments", {comment: comment, user_id: $scope.currentUserId }).then(function(response){
        $scope.loadComments($scope.currentVersionId);
        $scope.newComment = '';
      });
    };
    
  });
})();