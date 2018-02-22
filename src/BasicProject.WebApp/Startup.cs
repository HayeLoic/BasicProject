using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(BasicProject.WebApp.Startup))]

namespace BasicProject.WebApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
