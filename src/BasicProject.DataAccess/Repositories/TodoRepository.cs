using System;
using System.Collections.Generic;
using System.Linq;
using BasicProject.DataAccess.Cache;
using BasicProject.DataAccess.Dto;

namespace BasicProject.DataAccess.Repositories
{
    public class TodoRepository : ITodoRepository
    {
        private readonly IMemoryCacheService memoryCacheService;
        private const string TodosKey = "todos";
        private const int CacheDurationInSeconds = 3600;

        public TodoRepository(IMemoryCacheService memoryCacheService)
        {
            this.memoryCacheService = memoryCacheService;
        }

        public IEnumerable<TodoDto> GetTodos()
        {
            return this.memoryCacheService.AddOrGetExisting(TodosKey, GenerateTodos, DateTime.Now.AddSeconds(CacheDurationInSeconds).TimeOfDay);
        }

        public void InsertTodo(TodoDto todoDto)
        {
            List<TodoDto> todoDtos = this.GetTodos().ToList();
            todoDtos.Add(todoDto);
            this.memoryCacheService.InsertCache(TodosKey, todoDtos, DateTime.Now.AddSeconds(CacheDurationInSeconds).TimeOfDay);
        }

        public void UpdateTodo(TodoDto updatedTodoDto)
        {
            List<TodoDto> todoDtos = this.GetTodos().ToList();
            TodoDto todoDtoToRemove = todoDtos.FirstOrDefault(todoDto => todoDto.Id == updatedTodoDto.Id);
            if (todoDtoToRemove != null)
            {
                todoDtos.Remove(todoDtoToRemove);
                todoDtos.Add(updatedTodoDto);
            }
            this.memoryCacheService.InsertCache(TodosKey, todoDtos, DateTime.Now.AddSeconds(CacheDurationInSeconds).TimeOfDay);
        }

        public void DeleteTodo(int todoDtoId)
        {
            List<TodoDto> todoDtos = this.GetTodos().ToList();
            TodoDto todoDtoToDelete = todoDtos.FirstOrDefault(todoDto => todoDto.Id == todoDtoId);
            if (todoDtoToDelete != null)
            {
                todoDtos.Remove(todoDtoToDelete);
            }
            this.memoryCacheService.InsertCache(TodosKey, todoDtos, DateTime.Now.AddSeconds(CacheDurationInSeconds).TimeOfDay);
        }

        private List<TodoDto> GenerateTodos()
        {
            List<TodoDto> todos = new List<TodoDto>();
            int todoNumberToCreate = 15;
            for (int i = 0; i < todoNumberToCreate; i++)
            {
                todos.Add(new TodoDto
                {
                    Id = i,
                    Title = $"default {i}",
                    IsCompleted = false
                });
            }
            return todos;
        }
    }
}
