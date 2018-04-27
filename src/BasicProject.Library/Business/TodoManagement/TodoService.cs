using System.Collections.Generic;
using System.Linq;
using BasicProject.DataAccess.Dto;
using BasicProject.DataAccess.Repositories;

namespace BasicProject.Library.Business.TodoManagement
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

        public void InsertTodo(Todo todo)
        {
            TodoDto todoDto = new TodoDto
            {
                Id = GenerateTodoId(),
                Title = todo.Title,
                IsCompleted = todo.IsCompleted
            };
            this.todoRepository.InsertTodo(todoDto);
        }

        public void DeleteTodo(int todoId)
        {
            this.todoRepository.DeleteTodo(todoId);
        }

        private int GenerateTodoId()
        {
            List<TodoDto> todos = this.todoRepository.GetTodos().ToList();
            return !todos.Any()
                ? 1
                : todos.Max(dto => dto.Id) + 1;
        }
    }
}