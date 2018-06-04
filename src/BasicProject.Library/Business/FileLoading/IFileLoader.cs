using System.IO;

namespace BasicProject.Library.Business.FileLoading
{
    public interface IFileLoader
    {
        string GetDefaultUploadFileDestination();
        UploadFileResultModel UploadFile(Stream stream);
        UploadFileResultModel UploadFile(Stream stream, string destinationFolder, string fileName);
    }
}