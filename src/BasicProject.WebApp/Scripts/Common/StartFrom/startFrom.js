﻿// Paging limited for list
angular.module("basicProjectApp")
.filter("startFrom", function () {
    return function (input, start) {
        start = +start; //parse to int
        if (input)
            return input.slice(start);
        else
            return 1;
    };
});