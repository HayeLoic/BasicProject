"use strict";

angular.module("basicProjectApp")
.controller("todoListController", ["$scope", "todoListService", function ($scope, todoListService) {
    $scope.todos = [];
    $scope.todos.push({
        title: "default",
        isCompleted: false
    });
    $scope.clearCompletedTodosLabel = "Supprimer les tâches cochées";
    var okButtonLabel = "Oui";
    var cancelButtonLabel = "Non";
    $scope.removeTodoModalTitle = "Supprimer une tâche";
    $scope.removeTodoModalMessage = "Voulez-vous vraiment supprimer cette tâche ?";
    $scope.removeTodoModalOkButtonLabel = okButtonLabel;
    $scope.removeTodoModalCancelButtonLabel = cancelButtonLabel;
    $scope.clearCompletedTodosModalTitle = $scope.clearCompletedTodosLabel;
    $scope.clearCompletedTodosModalMessage = "Voulez-vous vraiment supprimer les tâches cochées ?";
    $scope.clearCompletedTodosModalOkButtonLabel = okButtonLabel;
    $scope.clearCompletedTodosModalCancelButtonLabel = cancelButtonLabel;
    $scope.markAllSetting = todoListService.getNextMarkAllSetting($scope.markAllSetting);
    $scope.removeTodoTarget = null;

    $scope.setRemoveTodo = function (todo) {
        $scope.removeTodoTarget = todo;
    };

    $scope.addTodo = function () {
        $scope.todos = todoListService.addTodo($scope.todos, $scope.newTodo);
        $scope.newTodo = "";
    };

    $scope.removeTodo = function () {
        $scope.todos = todoListService.removeTodo($scope.todos, $scope.removeTodoTarget);
        $scope.removeTodoTarget = null;
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