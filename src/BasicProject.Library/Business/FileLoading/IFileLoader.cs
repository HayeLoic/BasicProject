using System.IO;

namespace BasicProject.Library.Business.FileLoading
{
    public interface IFileLoader
    {
        void UploadFile(Stream stream);
    }
}