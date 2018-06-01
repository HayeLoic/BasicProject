using System.IO;

namespace BasicProject.Library.Business.FileLoading
{
    public class FileLoader : IFileLoader
    {
        public void UploadFile(Stream stream)
        {
            string destinationFolder = @"D:/BasicProject user files";
            string fileName = "fileName.txt";
            string destinationFullPath = Path.Combine(destinationFolder, fileName);

            if (!Directory.Exists(destinationFolder))
            {
                Directory.CreateDirectory(destinationFolder);
            }

            using (FileStream fileStream = File.Create(destinationFullPath))
            {
                stream.Seek(0, SeekOrigin.Begin);
                stream.CopyTo(fileStream);
            }
        }
    }
}