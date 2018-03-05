using System.Collections.Generic;
using BasicProject.Business.Models;

namespace BasicProject.Business.Services
{
    public interface ITodoService
    {
        List<Todo> GetTodos();
    }
}