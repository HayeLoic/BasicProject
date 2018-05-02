using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Web.Http;
using BasicProject.Library.Business.TodoManagement;

namespace BasicProject.WebApp.ApiControllers
{
    [RoutePrefix("api/todoList")]
    public class TodoListController : ApiController
    {
        private readonly ITodoService todoService;

        public TodoListController(ITodoService todoService)
        {
            this.todoService = todoService;
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

        [Route("updateTodo")]
        [HttpPost]
        public void UpdateTodo([FromBody]Todo todo)
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
