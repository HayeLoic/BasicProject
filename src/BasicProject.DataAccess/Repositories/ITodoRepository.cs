﻿using System.Collections.Generic;
using BasicProject.DataAccess.Dto;

namespace BasicProject.DataAccess.Repositories
{
    public interface ITodoRepository
    {
        IEnumerable<TodoDto> GetTodos();
        void InsertTodo(TodoDto todoDto);
        void UpdateTodo(TodoDto todoDto);
        void DeleteTodo(int todoDtoId);
    }
}