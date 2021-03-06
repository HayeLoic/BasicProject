﻿"use strict";

angular.module("basicProjectApp")
.controller("loadFileController", ["$scope", "loadFileService", function ($scope, loadFileService) {
    $scope.uploadFileDestination = null;
    $scope.uploadFileResult = null;
    $scope.warningMessage = null;
    $scope.files = null;
    var uploadFileToReadStreamId = "uploadFileToReadStream";
    var uploadFileId = "uploadFile";
    var noFileSelectedWarning = "Aucun fichier n'est séléctionné";

    var setUploadFileDestination = function (result) {
        $scope.uploadFileDestination = result;
    };

    var getDefaultUploadFileDestination = function () {
        loadFileService.getDefaultUploadFileDestination(setUploadFileDestination);
    };

    var setUploadFileResult = function (result) {
        $scope.uploadFileResult = result;
    };

    var resetUploaders = function () {
        document.getElementById(uploadFileToReadStreamId).value = "";
        document.getElementById(uploadFileId).value = "";
    };

    var setFiles = function (result) {
        $scope.files = result;
    };

    $scope.uploadFileToReadStream = function () {
        var selectedFile = document.getElementById(uploadFileToReadStreamId).files[0];
        if (selectedFile) {
            loadFileService.uploadFileToReadStream($scope.uploadFileDestination, selectedFile, setUploadFileResult, resetUploaders);

        } else {
            $scope.warningMessage = noFileSelectedWarning;
        }
    };

    $scope.uploadFile = function () {
        var selectedFile = document.getElementById(uploadFileId).files[0];
        if (selectedFile) {
            loadFileService.uploadFile($scope.uploadFileDestination, selectedFile, setUploadFileResult, resetUploaders);

        } else {
            $scope.warningMessage = noFileSelectedWarning;
        }
    };

    var getFiles = function () {
        loadFileService.getFiles(setFiles);
    };

    $scope.thereIsFile = function () {
        if ($scope.files && $scope.files.length > 0) {
            return true;
        } else {
            return false;
        }
    };

    $scope.downloadFile = function (file) {
        loadFileService.downloadFile(file);
    };

    getDefaultUploadFileDestination();
    setInterval(getFiles, 500);
}]);