using System.IO;

namespace BasicProject.Library.Business.FileLoading
{
    public class FileLoader : IFileLoader
    {
        private const string DefaultDestinationFolder = @"D:/BasicProject user files";
        private const string DefaultFileName = "DefaultFileName.txt";

        public string GetDefaultUploadFileDestination()
        {
            return DefaultDestinationFolder;
        }

        public UploadFileResultModel UploadFile(Stream stream)
        {
            return this.UploadFile(stream, DefaultDestinationFolder, DefaultFileName);
        }

        public UploadFileResultModel UploadFile(Stream stream, string destinationFolder, string fileName)
        {
            UploadFileResultModel uploadFileResultModel = new UploadFileResultModel
            {
                FileDestination = Path.Combine(destinationFolder, fileName)
            };

            if (!Directory.Exists(destinationFolder))
            {
                Directory.CreateDirectory(destinationFolder);
            }

            using (FileStream fileStream = File.Create(uploadFileResultModel.FileDestination))
            {
                stream.Seek(0, SeekOrigin.Begin);
                stream.CopyTo(fileStream);
            }
            uploadFileResultModel.SuccessMessage = "Fichier uploadé";
            return uploadFileResultModel;
        }
    }
}