"use strict";

angular.module("basicProjectApp")
.controller("todoListController", ["$scope", "todoListService", function ($scope, todoListService) {
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
    $scope.itemsPerPageOptions = todoListService.itemsPerPageOptions;
    $scope.itemsPerPage = todoListService.getItemsPerPage();
    $scope.currentPage = 1;
    $scope.updatingTodo = null;
    $scope.orderById = todoListService.orderById;
    $scope.orderByTitle = todoListService.orderByTitle;

    $scope.changeItemsPerPage = function () {
        todoListService.setItemsPerPage($scope.itemsPerPage);
        if ($scope.todos) {
            $scope.goToPage(1);
        }
    };

    $scope.goToPage = function (page) {
        $scope.currentPage = page;
    };

    var setTodos = function (todos) {
        $scope.todos = todos;
    };

    var getTodos = function () {
        $scope.todos = todoListService.getTodos(setTodos);
    };

    getTodos();

    $scope.setRemoveTodo = function (todo) {
        $scope.removeTodoTarget = todo;
    };

    $scope.addTodo = function () {
        $scope.todos = todoListService.addTodo($scope.newTodo, getTodos);
        $scope.newTodo = "";
    };

    $scope.updateTodo = function (todo) {
        $scope.todos = todoListService.updateTodo(todo, getTodos);
        $scope.updatingTodo = null;
    };

    $scope.removeTodo = function () {
        $scope.todos = todoListService.removeTodo($scope.removeTodoTarget, getTodos);
        $scope.removeTodoTarget = null;
    };

    $scope.markAllTodos = function () {
        $scope.todos = todoListService.markAllTodos($scope.todos, $scope.markAllSetting);
        $scope.markAllSetting = todoListService.getNextMarkAllSetting($scope.markAllSetting);
    };

    $scope.clearCompletedTodos = function () {
        $scope.todos = todoListService.clearCompletedTodos($scope.todos, getTodos);
    };

    $scope.hasSomeCompletedTodo = function () {
        return todoListService.hasSomeCompletedTodo($scope.todos);
    };

    $scope.isInUpdateMode = function () {
        return todoListService.isInUpdateMode($scope.updatingTodo);
    };

    $scope.isUpdating = function (todo) {
        return todoListService.isUpdating($scope.updatingTodo, todo);
    };

    $scope.setUpdatingTodo = function (todo) {
        $scope.updatingTodo = JSON.parse(JSON.stringify(todo));
    };

    $scope.rollbackUpdatingTodo = function (todo) {
        todo.title = $scope.updatingTodo.title;
        $scope.updatingTodo = null;
    };

    $scope.orderTodos = function (orderFunction) {
        $scope.todos = orderFunction($scope.todos);
    };
}]);