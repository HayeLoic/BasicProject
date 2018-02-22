"use strict";

angular.module("basicProjectApp")
.service("todoListService", function () {
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

    return {
        getNextMarkAllSetting: getNextMarkAllSetting,
        addTodo: addTodo,
        removeTodo: removeTodo,
        markAllTodos: markAllTodos,
        clearCompletedTodos: clearCompletedTodos,
        hasSomeCompletedTodo: hasSomeCompletedTodo
    };
});