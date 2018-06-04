"use strict";

angular.module("basicProjectApp")
.service("loadFileService", ["$http", function ($http) {
    var apiUrls = {
        getDefaultUploadFileDestination: "api/loadFile/getDefaultUploadFileDestination",
        uploadFile: "api/loadFile/uploadFile"
    };

    var getDefaultUploadFileDestination = function (callback) {
        $http.get(apiUrls.getDefaultUploadFileDestination)
            .then(function (result) {
                callback(result.data);
            });
    };

    var uploadFile = function (uploadFileDestination, selectedFile, callbackSetResult, callbackResetElement) {
        var resource = $http.post(apiUrls.uploadFile, selectedFile, selectedFile.name);
        resource.then(function (result) {
            callbackSetResult(result.data);
            callbackResetElement();
        });
    };

    return {
        getDefaultUploadFileDestination: getDefaultUploadFileDestination,
        uploadFile: uploadFile
    };
}]);