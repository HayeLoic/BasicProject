using System.Collections.Generic;

namespace BasicProject.Library.Business.TodoManagement
{
    public interface ITodoService
    {
        List<Todo> GetTodos();
        void InsertTodo(Todo todo);
        void DeleteTodo(int todoId);
    }
}