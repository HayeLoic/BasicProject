"use strict";

angular.module("basicProjectApp")
.service("loadFileService", ["$http", function ($http) {
    var apiUrls = {
        getDefaultUploadFileDestination: "api/loadFile/getDefaultUploadFileDestination",
        uploadFileToReadStream: "api/loadFile/uploadFileToReadStream",
        uploadFile: "api/loadFile/uploadFile"
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

    return {
        getDefaultUploadFileDestination: getDefaultUploadFileDestination,
        uploadFileToReadStream: uploadFileToReadStream,
        uploadFile: uploadFile
    };
}]);