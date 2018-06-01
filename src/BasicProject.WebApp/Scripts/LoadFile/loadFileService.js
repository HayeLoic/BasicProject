"use strict";

angular.module("basicProjectApp")
.service("loadFileService", ["$http", function ($http) {
    var apiUrls = {
        uploadFile: "api/loadFile/uploadFile"
    };

    var getDefaultUploadFileDestination = function () {
        return "D:/BasicProject user files";
    };

    var uploadFile = function (uploadFileDestination, selectedFile, callbackSetResult, callbackResetElement) {
        var resource = $http.post(url.resolve(apiUrls.uploadFile), selectedFile);
        resource.then(function (dataResults) {
            callbackSetResult(dataResults);
            callbackResetElement();
        });
    };

    return {
        getDefaultUploadFileDestination: getDefaultUploadFileDestination,
        uploadFile: uploadFile
    };
}]);