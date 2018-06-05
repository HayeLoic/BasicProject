using System.Collections.Generic;
using System.IO;
using System.Linq;

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

        public IEnumerable<FileModel> GetFiles(string folderPath)
        {
            if (Directory.Exists(folderPath))
            {
                DirectoryInfo directoryInfo = new DirectoryInfo(folderPath);
                return directoryInfo
                    .GetFiles()
                    .Select(fileInfo => new FileModel
                    {
                        Name = fileInfo.Name,
                        FullPath = fileInfo.FullName
                    }).ToList();
            }
            else
            {
                return null;
            }
        }
    }
}