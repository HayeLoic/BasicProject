"use strict";

angular.module("basicProjectApp")
.service("todoListService", ["$http", function ($http) {
    var apiUrls = {
        getTodos: "api/todoList/getTodos",
        insertTodo: "api/todoList/insertTodo",
        updateTodo: "api/todoList/updateTodo",
        deleteTodo: "api/todoList/deleteTodo"
    };
    var itemsPerPageOptions = [5, 10, 50];
    var itemsPerPage = itemsPerPageOptions[0];
    var markAll = {
        value: true,
        label: "Tout cocher"
    };
    var unMarkAll = {
        value: false,
        label: "Tout décocher"
    };

    var getNextMarkAllSetting = function (markAllSetting) {
        return (markAllSetting === markAll) ? unMarkAll : markAll;
    };

    var getTodos = function (callback) {
        $http.get(apiUrls.getTodos)
            .then(function (result) {
                callback(result.data);
            });
    };

    var addTodo = function (todoTitle, callback) {
        todoTitle = todoTitle.trim();
        if (todoTitle.length) {
            var todo = {
                id: 0,
                title: todoTitle,
                isCompleted: false
            };
            $http.post(apiUrls.insertTodo, todo)
                .then(function () {
                    callback();
                });
        }
    };

    var removeTodo = function (todos, todo) {
        todos.splice(todos.indexOf(todo), 1);
        return todos;
    };

    var markAllTodos = function (todos, markAllSetting) {
        todos.forEach(function (todo) {
            todo.isCompleted = markAllSetting.value;
        });
        return todos;
    };

    var clearCompletedTodos = function (todos) {
        return todos.filter(function (todo) {
            return !todo.isCompleted;
        });
    };

    var isCompletedTodo = function (todo) {
        return todo.isCompleted;
    };

    var hasSomeCompletedTodo = function (todos) {
        return _.some(todos, isCompletedTodo);
    };

    var getItemsPerPage = function () {
        return itemsPerPage;
    };

    var setItemsPerPage = function (number) {
        itemsPerPage = number;
    };

    return {
        getNextMarkAllSetting: getNextMarkAllSetting,
        getTodos: getTodos,
        addTodo: addTodo,
        removeTodo: removeTodo,
        markAllTodos: markAllTodos,
        clearCompletedTodos: clearCompletedTodos,
        hasSomeCompletedTodo: hasSomeCompletedTodo,
        itemsPerPageOptions: itemsPerPageOptions,
        getItemsPerPage: getItemsPerPage,
        setItemsPerPage: setItemsPerPage
    };
}]);