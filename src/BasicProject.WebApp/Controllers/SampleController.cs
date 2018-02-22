using System.Web.Mvc;

namespace BasicProject.WebApp.Controllers
{
    public class SampleController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}