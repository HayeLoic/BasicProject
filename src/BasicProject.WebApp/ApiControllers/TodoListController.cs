using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using BasicProject.Business.Models;
using BasicProject.Business.Services;
using BasicProject.DataAccess.Repositories;

namespace BasicProject.WebApp.ApiControllers
{
    public class TodoListController : ApiController
    {
        private readonly ITodoService todoService;

        public TodoListController()
        {
            this.todoService = new TodoService(new TodoRepository());
        }

        [HttpGet]
        public IEnumerable<Todo> GetTodos()
        {
            return this.todoService.GetTodos();
        }
    }
}
