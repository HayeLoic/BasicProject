using System;
using System.Timers;
using BasicProject.Library.Business;
using BasicProject.Library.Infrastructure.Log;

namespace BasicProject.Service
{
    public class BasicProjectService
    {
        private const string ServiceName = "BasicProject.Service";
        private static Timer timer;
        private IProjectOrchestrator projectOrchestrator;

        public Timer ServiceEventTimer
        {
            get { return timer; }
            set { timer = value; }
        }

        public void Start()
        {
            LogHelper.Info($"[{ServiceName}] started");
            Initialize();
            ServiceListener();
        }

        private void Initialize()
        {
            try
            {
                projectOrchestrator = new ProjectOrchestrator();
                LogHelper.Info($"{ServiceName} has been initialized");
            }
            catch (Exception exception)
            {
                LogHelper.Error(exception);
            }
        }

        private void ServiceListener()
        {
            ServiceEventTimer = new Timer
            {
                Interval = projectOrchestrator.GetExecuteIntervalInMilliseconds()
            };
            ServiceEventTimer.Elapsed += ServiceEventTimer_Elapsed;
            ServiceEventTimer.Start();
        }

        public void Stop()
        {
            if (ServiceEventTimer != null)
            {
                ServiceEventTimer.Stop();
                ServiceEventTimer.Dispose();
            }
            LogHelper.Info($"[{ServiceName}] ended");
        }

        void ServiceEventTimer_Elapsed(object sender, ElapsedEventArgs e)
        {
            try
            {
                projectOrchestrator.Execute();
            }
            catch (Exception exception)
            {
                LogHelper.Error(exception);
            }
        }
    }
}
