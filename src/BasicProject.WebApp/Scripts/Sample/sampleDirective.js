"use strict";

angular.module("basicProjectApp")
.directive("sampleDirective", function () {
    return {
        templateUrl: "/Scripts/Sample/sample.html",
        controller: function ($scope) {
            $scope.value = "test value";
        }
    }
});