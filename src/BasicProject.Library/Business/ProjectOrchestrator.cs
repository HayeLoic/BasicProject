using System;
using System.Collections.Generic;
using System.Reflection;
using BasicProject.Library.Configuration;
using BasicProject.Library.Dto;
using BasicProject.Library.Repository;
using Ninject;
using Ninject.Parameters;

namespace BasicProject.Library.Business
{
    public class ProjectOrchestrator: IProjectOrchestrator
    {
        private readonly IRepository repository;
        private readonly IApplicationSettings applicationSettings;
        private bool isServiceRunning;

        public ProjectOrchestrator()
        {
            StandardKernel kernel = new StandardKernel();
            kernel.Load(Assembly.GetExecutingAssembly());
            this.repository = kernel.Get<IRepository>(new ConstructorArgument("kernel", kernel));
            this.applicationSettings = kernel.Get<IApplicationSettings>(new ConstructorArgument("kernel", kernel));
        }

        public int GetExecuteIntervalInMilliseconds()
        {
            return applicationSettings.IntSetting * 1000;
        }

        public void Execute()
        {
            try
            {
                if (!isServiceRunning)
                {
                    isServiceRunning = true;
                    this.DoSomething();
                    isServiceRunning = false;
                }
            }
            catch (Exception)
            {
                isServiceRunning = false;
                throw;
            }
        }

        private void DoSomething()
        {
            IEnumerable<SampleObject> sampleSampleObjects = this.repository.GetSampleSampleObjects(this.applicationSettings.StringSetting);
        }
    }
}
