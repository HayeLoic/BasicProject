"use strict";

angular.module("basicProjectApp")
.service("loadFileService", ["$http", "$window", function ($http, $window) {
    var apiUrls = {
        getDefaultUploadFileDestination: "api/loadFile/getDefaultUploadFileDestination",
        uploadFileToReadStream: "api/loadFile/uploadFileToReadStream",
        uploadFile: "api/loadFile/uploadFile",
        getFiles: "api/loadFile/getFiles",
        downloadFile: "/api/loadFile/downloadFile"
    };

    var getDefaultUploadFileDestination = function (callback) {
        $http.get(apiUrls.getDefaultUploadFileDestination)
            .then(function (result) {
                callback(result.data);
            });
    };

    var uploadFileToReadStream = function (uploadFileDestination, selectedFile, callbackSetResult, callbackResetElement) {
        var resource = $http.post(apiUrls.uploadFileToReadStream, selectedFile);
        resource.then(function (result) {
            callbackSetResult(result.data);
            callbackResetElement();
        });
    };

    var uploadFile = function (uploadFileDestination, selectedFile, callbackSetResult, callbackResetElement) {
        var formData = new FormData();
        formData.append("selectedFile", selectedFile);
        formData.append("fileName", selectedFile.name);

        var resource = $http({
            url: apiUrls.uploadFile,
            method: "POST",
            data: formData,
            headers: {
                "Content-Type": undefined
            }
        });

        resource.then(function (result) {
            callbackSetResult(result.data);
            callbackResetElement();
        });
    };

    var getFiles = function (callback) {
        $http.get(apiUrls.getFiles)
            .then(function (result) {
                callback(result.data);
            });
    };
    
    var downloadFile = function (file) {
        $window.location.href = apiUrls.downloadFile + "/" + file.id;
    };

    return {
        getDefaultUploadFileDestination: getDefaultUploadFileDestination,
        uploadFileToReadStream: uploadFileToReadStream,
        uploadFile: uploadFile,
        getFiles: getFiles,
        downloadFile: downloadFile
    };
}]);