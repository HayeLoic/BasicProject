using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Web.Http;
using BasicProject.Business.TodoManagement;
using BasicProject.DataAccess.Cache;
using BasicProject.DataAccess.Repositories;

namespace BasicProject.WebApp.ApiControllers
{
    public class TodoListController : ApiController
    {
        private readonly ITodoService todoService;

        public TodoListController()
        {
            this.todoService = new TodoService(new TodoRepository(new MemoryCacheService()));
        }

        [HttpGet]
        public IEnumerable<Todo> GetTodos()
        {
            try
            {
                return this.todoService.GetTodosFromCache();
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
                return null;
            }
        }

        [HttpPost]
        public void InsertTodo(Todo todo)
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

        [HttpPost]
        public void UpdateTodo(Todo todo)
        {
            try
            {
                this.todoService.UpdateTodo(todo);
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
            }

        }

        [HttpPost]
        public void DeleteTodo(int todoId)
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
    }
}
