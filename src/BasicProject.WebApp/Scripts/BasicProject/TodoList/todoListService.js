"use strict";

angular.module("basicProjectApp")
.service("todoListService", function () {
    var getTodoListTime = function () {
        return new Date().toLocaleTimeString();
    };

    return {
        getTodoListTime: getTodoListTime
    };
});