using System.Web.Optimization;

namespace BasicProject.WebApp
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                "~/Scripts/jquery.unobtrusive*",
                "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/knockout").Include(
                "~/Scripts/knockout-{version}.js",
                "~/Scripts/knockout.validation.js"));

            bundles.Add(new ScriptBundle("~/bundles/less").Include(
                "~/Scripts/less.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/app").Include(
                "~/Scripts/sammy-{version}.js",
                "~/Scripts/app/common.js",
                "~/Scripts/app/app.datamodel.js",
                "~/Scripts/app/app.viewmodel.js",
                "~/Scripts/app/home.viewmodel.js",
                "~/Scripts/app/_run.js"));

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                "~/Scripts/bootstrap.js",
                "~/Scripts/respond.js"));
            
            bundles.Add(new StyleBundle("~/Content/css").Include(
                 "~/Content/bootstrap.css",
                 "~/Content/font-awesome.css",
                 "~/Content/Site.css"));

            Bundle lessBundle = new Bundle("~/Content/Less").IncludeDirectory("~/Content", "*.less");
            lessBundle.Transforms.Add(new LessTransform());
            lessBundle.Transforms.Add(new CssMinify());
            bundles.Add(lessBundle);

            bundles.Add(new ScriptBundle("~/bundles/angular").Include(
                "~/Scripts/angular.js",
                "~/Scripts/angular-sanitize.js",
                "~/Scripts/angular-ui/ui-bootstrap.js",
                "~/Scripts/angular-ui/ui-bootstrap-tpls.js"));

            bundles.Add(new ScriptBundle("~/bundles/underscore").Include(
                "~/Scripts/underscore.js"));

            bundles.Add(new ScriptBundle("~/bundles/basicProject").Include(
                "~/Scripts/basicProject.js",
                "~/Scripts/Common/StartFrom/startFrom.js",
                "~/Scripts/Common/CustomModal/customModal.js"));

            bundles.Add(new ScriptBundle("~/bundles/sample").Include(
                "~/Scripts/Sample/sampleDirective.js"));

            bundles.Add(new ScriptBundle("~/bundles/todoList").Include(
                "~/Scripts/TodoList/todoListService.js",
                "~/Scripts/TodoList/todoListController.js"));

            bundles.Add(new StyleBundle("~/Content/css/todoList").Include(
                 "~/Content/todoList.css"));
        }
    }
}
