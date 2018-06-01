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

        [Route("uploadFile")]
        [HttpPost]
        public async Task<string> UploadFile()
        {
            try
            {
                if (!Request.Content.IsMimeMultipartContent())
                {
                    throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
                }

                MultipartMemoryStreamProvider provider = new MultipartMemoryStreamProvider();
                await Request.Content.ReadAsMultipartAsync(provider);
                Stream stream = provider.Contents[0].ReadAsStreamAsync().Result;
                this.fileLoader.UploadFile(stream);
                return "ok";
            }
            catch (Exception exception)
            {
                Debug.Write(exception);
                return "pas ok";
            }
        }
    }
}
