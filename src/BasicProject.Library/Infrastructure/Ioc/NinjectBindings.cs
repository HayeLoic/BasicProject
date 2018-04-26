using BasicProject.Library.Configuration;
using BasicProject.Library.Repository;
using Ninject.Modules;

namespace BasicProject.Library.Infrastructure.Ioc
{
    public class NinjectBindings : NinjectModule
    {
        public override void Load()
        {
            Bind<IDatabaseConfiguration>().To<DatabaseConfiguration>();
            Bind<IApplicationSettings>().To<ApplicationSettings>();
            Bind<IRepository>().To<BasicProject.Library.Repository.Repository>();
        }
    }
}