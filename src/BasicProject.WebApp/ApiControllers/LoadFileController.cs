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
    }
}
