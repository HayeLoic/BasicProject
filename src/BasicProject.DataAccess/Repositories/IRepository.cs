using System.Collections.Generic;
using BasicProject.DataAccess.Dto;

namespace BasicProject.DataAccess.Repositories
{
    public interface IRepository
    {
        IEnumerable<SampleObject> GetSampleSampleObjects(string parameter);
    }
}