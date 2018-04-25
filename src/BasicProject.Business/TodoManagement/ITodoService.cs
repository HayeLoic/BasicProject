using System.Collections.Generic;

namespace BasicProject.Business.TodoManagement
{
    public interface ITodoService
    {
        List<Todo> GetTodosFromCache();
        void InsertTodo(Todo todo);
        void UpdateTodo(Todo todo);
        void DeleteTodo(int todoId);
    }
}