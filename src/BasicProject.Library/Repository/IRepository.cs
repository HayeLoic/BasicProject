using System.Collections.Generic;
using BasicProject.Library.Dto;

namespace BasicProject.Library.Repository
{
    public interface IRepository
    {
        IEnumerable<SampleObject> GetSampleSampleObjects(string parameter);
    }
}