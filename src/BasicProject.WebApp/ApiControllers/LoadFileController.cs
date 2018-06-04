using System;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using BasicProject.Library.Business.FileLoading;

namespace BasicProject.WebApp.ApiControllers
{
    [RoutePrefix("api/loadFile")]
    public class LoadFileController : ApiController
    {
        private readonly IFileLoader fileLoader;

        public LoadFileController(IFileLoader fileLoader)
        {
            this.fileLoader = fileLoader;
        }

        [Route("getDefaultUploadFileDestination")]
        [HttpGet]
        public string GetDefaultUploadFileDestination()
        {

            return this.fileLoader.GetDefaultUploadFileDestination();
        }

        [Route("uploadFile")]
        [HttpPost]
        //public async Task<UploadFileModel> UploadFile()
        public UploadFileResultModel UploadFile([FromBody] string name)
        {
            UploadFileResultModel uploadFileResultModel = new UploadFileResultModel();
            try
            {
                //if (!Request.Content.IsMimeMultipartContent())
                //{
                //    throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
                //}

                //MultipartMemoryStreamProvider provider = new MultipartMemoryStreamProvider();
                //await Request.Content.ReadAsMultipartAsync(provider);
                //Stream stream = provider.Contents[0].ReadAsStreamAsync().Result;
                Stream stream = this.Request.Content.ReadAsStreamAsync().Result;
                uploadFileResultModel = this.fileLoader.UploadFile(stream);
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
                uploadFileResultModel.ErrorMessage = exception.Message;
            }
            return uploadFileResultModel;
        }
    }
}
