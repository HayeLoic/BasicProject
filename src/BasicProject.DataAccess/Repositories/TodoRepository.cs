using System.Collections.Generic;
using BasicProject.DataAccess.Dto;

namespace BasicProject.DataAccess.Repositories
{
    public class TodoRepository : ITodoRepository
    {
        public IEnumerable<TodoDto> GetTodos()
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
