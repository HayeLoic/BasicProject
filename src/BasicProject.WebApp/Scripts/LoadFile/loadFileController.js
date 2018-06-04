"use strict";

angular.module("basicProjectApp")
.controller("loadFileController", ["$scope", "loadFileService", function ($scope, loadFileService) {
    $scope.uploadFileDestination = null;
    $scope.uploadFileResult = null;
    $scope.warningMessage = null;
    var uploadFileId = "uploadFile";

    var setUploadFileDestination = function (result) {
        $scope.uploadFileDestination = result;
    };

    var getDefaultUploadFileDestination = function () {
        loadFileService.getDefaultUploadFileDestination(setUploadFileDestination);
    };

    var setUploadFileResult = function (result) {
        $scope.uploadFileResult = result;
    };

    var resetUploader = function () {
        document.getElementById(uploadFileId).value = "";
    };

    $scope.uploadFile = function () {
        var selectedFile = document.getElementById(uploadFileId).files[0];
        if (selectedFile) {
            loadFileService.uploadFile($scope.uploadFileDestination, selectedFile, setUploadFileResult, resetUploader);
            
        } else {
            $scope.warningMessage = "Aucun fichier n'est séléctioné";
        }
    };

    getDefaultUploadFileDestination();
}]);