"use strict";

angular.module("basicProjectApp")
.controller("todoListController", ["$scope", "todoListService", function ($scope, todoListService) {
    $scope.todoListTime = todoListService.getTodoListTime();
    $scope.todos = [];
    $scope.todos.push({
        title: "default",
        isCompleted: false
    });

    var markAll = {
        value: true,
        label: "Tout cocher"
    };
    var unMarkAll = {
        value: false,
        label: "Tout décocher"
    };
    $scope.markAllSetting = markAll;

    var getNextMarkAllSetting = function (markAllSetting) {
        return markAllSetting === unMarkAll ? markAll : unMarkAll;
    };

    $scope.addTodo = function () {
        var newTodo = $scope.newTodo.trim();
        if (!newTodo.length) {
            return;
        }
        $scope.todos.push({
            title: newTodo,
            isCompleted: false
        });
        $scope.newTodo = "";
    };

    $scope.removeTodo = function (todo) {
        $scope.todos.splice($scope.todos.indexOf(todo), 1);
    };

    $scope.markAll = function () {
        $scope.todos.forEach(function (todo) {
            todo.isCompleted = $scope.markAllSetting.value;
        });
        $scope.markAllSetting = getNextMarkAllSetting($scope.markAllSetting);
    };

    $scope.clearCompletedTodos = function () {
        $scope.todos = $scope.todos.filter(function (todo) {
            return !todo.isCompleted;
        });
    };

    var isCompletedTodo = function (todo) {
        return todo.isCompleted;
    };

    $scope.hasSomeCompletedTodo = function () {
        return _.some($scope.todos, isCompletedTodo);
    };
}]);