using Topshelf;

namespace BasicProject.Service
{
    class Program
    {
        static void Main(string[] args)
        {
            HostFactory.Run(host =>
            {
                host.Service<BasicProjectService>(s =>
                {
                    s.ConstructUsing(name => new BasicProjectService());
                    s.WhenStarted(tc => tc.Start());
                    s.WhenStopped(tc => tc.Stop());
                });

                host.RunAsLocalSystem();
                host.SetDescription("Basic project sample");
                host.SetDisplayName("BasicProject.Service");
                host.SetServiceName("BasicProject.Service");
            });
        }
    }
}
