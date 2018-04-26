using System.Collections.Generic;

namespace BasicProject.Business.TodoManagement
{
    public interface ITodoService
    {
        List<Todo> GetTodos();
        void InsertTodo(Todo todo);
        void DeleteTodo(int todoId);
    }
}