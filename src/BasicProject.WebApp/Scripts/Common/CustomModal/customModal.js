"use strict";

angular.module("basicProjectApp")
    .directive("customModal", function () {
        return {
            restrict: "A",
            replace: true,
            templateUrl: "/Scripts/Common/CustomModal/custom-modal.html",
            scope: {
                customModalTitle: "=",
                customModalMessage: "=",
                customModalOkButtonLabel: "=",
                customModalCancelButtonLabel: "=",
                okFunction: "="
            }
        };
    });