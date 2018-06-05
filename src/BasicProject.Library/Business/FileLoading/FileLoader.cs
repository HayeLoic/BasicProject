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
            List<FileModel> fileModels = new List<FileModel>();
            if (Directory.Exists(folderPath))
            {
                int fileModelId = 1;
                DirectoryInfo directoryInfo = new DirectoryInfo(folderPath);
                foreach (FileInfo fileInfo in directoryInfo.GetFiles())
                {
                    fileModels.Add(new FileModel
                    {
                        Id = fileModelId,
                        Name = fileInfo.Name,
                        FullPath = fileInfo.FullName
                    });
                    fileModelId++;
                }
            }
            return fileModels;
        }

        public FileModel GetFile(int fileId, string folderPath)
        {
            return this.GetFiles(folderPath).FirstOrDefault(fileModel => fileModel.Id == fileId);
        }

        public Stream GetStream(int fileId, string folderPath)
        {
            FileModel fileModel = this.GetFile(fileId, folderPath);

            if (fileModel != null && File.Exists(fileModel.FullPath))
            {
                byte[] fileBytes = File.ReadAllBytes(fileModel.FullPath);
                return new MemoryStream(fileBytes);
            }
            else
            {
                return Stream.Null;
            }
        }
    }
}