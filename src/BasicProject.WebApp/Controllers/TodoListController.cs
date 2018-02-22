using System.Web.Mvc;

namespace BasicProject.WebApp.Controllers
{
    public class TodoListController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
