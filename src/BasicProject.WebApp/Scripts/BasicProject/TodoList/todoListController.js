"use strict";

angular.module("basicProjectApp")
.controller("todoListController", ["$scope", "todoListService", function ($scope, todoListService) {
    $scope.todos = [];
    $scope.todos.push({
        title: "default",
        isCompleted: false
    });

    $scope.markAllSetting = todoListService.getNextMarkAllSetting($scope.markAllSetting);

    $scope.addTodo = function () {
        $scope.todos = todoListService.addTodo($scope.todos, $scope.newTodo);
        $scope.newTodo = "";
    };

    $scope.removeTodo = function (todo) {
        $scope.todos = todoListService.removeTodo($scope.todos, todo);
    };

    $scope.markAllTodos = function () {
        $scope.todos = todoListService.markAllTodos($scope.todos, $scope.markAllSetting);
        $scope.markAllSetting = todoListService.getNextMarkAllSetting($scope.markAllSetting);
    };

    $scope.clearCompletedTodos = function () {
        $scope.todos = todoListService.clearCompletedTodos($scope.todos);
    };

    $scope.hasSomeCompletedTodo = function () {
        return todoListService.hasSomeCompletedTodo($scope.todos);
    };
}]);