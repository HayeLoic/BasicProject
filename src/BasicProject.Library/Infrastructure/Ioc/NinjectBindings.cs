using BasicProject.DataAccess.Cache;
using BasicProject.DataAccess.Configuration;
using BasicProject.DataAccess.Repositories;
using BasicProject.Library.Business.TodoManagement;
using BasicProject.Library.Configuration;
using Ninject.Modules;

namespace BasicProject.Library.Infrastructure.Ioc
{
    public class NinjectBindings : NinjectModule
    {
        public override void Load()
        {
            Bind<IDatabaseConfiguration>().To<DatabaseConfiguration>();
            Bind<IApplicationSettings>().To<ApplicationSettings>();
            Bind<ITodoService>().To<TodoService>();
            Bind<IMemoryCacheService>().To<MemoryCacheService>();
            Bind<ITodoRepository>().To<TodoRepository>();
            Bind<IRepository>().To<Repository>();
        }
    }
}