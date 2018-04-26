﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Web.Http;
using BasicProject.Business.TodoManagement;
using BasicProject.DataAccess.Cache;
using BasicProject.DataAccess.Repositories;

namespace BasicProject.WebApp.ApiControllers
{
    [RoutePrefix("api/todoList")]
    public class TodoListController : ApiController
    {
        private readonly ITodoService todoService;

        public TodoListController()
        {
            this.todoService = new TodoService(new TodoRepository(new MemoryCacheService()));
        }

        [Route("getTodos")]
        [HttpGet]
        public IEnumerable<Todo> GetTodos()
        {
            try
            {
                return this.todoService.GetTodos();
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
                return null;
            }
        }

        [Route("insertTodo")]
        [HttpPost]
        public void InsertTodo([FromBody]Todo todo)
        {
            try
            {
                this.todoService.InsertTodo(todo);
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
            }
        }

        [Route("deleteTodo")]
        [HttpPost]
        public void DeleteTodo([FromBody]int todoId)
        {
            try
            {
                this.todoService.DeleteTodo(todoId);
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
            }
        }

        [Route("deleteTodos")]
        [HttpPost]
        public void DeleteTodo([FromBody]List<int> todoIds)
        {
            try
            {
                foreach (int id in todoIds)
                {
                    this.todoService.DeleteTodo(id);
                }
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
            }
        }
    }
}
