"use strict";

angular.module("basicProjectApp")
.service("todoListService", function () {
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

    var getTodos = function () {
        var todos = [];
        for (var i = 0; i < 15; i++) {
            todos.push({
                title: "default " + i,
                isCompleted: false
            });
        }
        return todos;
    };

    var addTodo = function (todos, newTodo) {
        newTodo = newTodo.trim();
        if (!newTodo.length) {
            return todos;
        }
        todos.push({
            title: newTodo,
            isCompleted: false
        });
        return todos;
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
});