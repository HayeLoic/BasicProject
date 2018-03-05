using System.Collections.Generic;
using System.Linq;
using BasicProject.Business.Models;
using BasicProject.DataAccess.Dto;
using BasicProject.DataAccess.Repositories;

namespace BasicProject.Business.Services
{
    public class TodoService : ITodoService
    {
        private readonly ITodoRepository todoRepository;

        public TodoService(ITodoRepository todoRepository)
        {
            this.todoRepository = todoRepository;
        }

        public List<Todo> GetTodos()
        {
            IEnumerable<TodoDto> todoDtos = this.todoRepository.GetTodos();
            return todoDtos.Select(todoDto => new Todo
            {
                Id = todoDto.Id,
                Title = todoDto.Title,
                IsCompleted = todoDto.IsCompleted
            }).ToList();
        }
    }
}