"use strict";

angular.module("basicProjectApp")
.controller("loadFileController", ["$scope", "loadFileService", function ($scope, loadFileService) {
    $scope.uploadFileDestination = loadFileService.getDefaultUploadFileDestination();
    $scope.UploadFileResult = null;

    var setUploadFileResult = function (result) {
        $scope.UploadFileResult = result;
    };

    var resetUploader = function () {
        document.getElementById("file").value = "";
    };

    $scope.uploadFile = function () {
        var selectedFile = document.getElementById("file").files[0];
        loadFileService.uploadFile($scope.uploadFileDestination, selectedFile, setUploadFileResult, resetUploader);
    };
}]);