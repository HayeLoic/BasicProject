using System;
using BasicProject.Library.Infrastructure.Version;
using NLog;

namespace BasicProject.Library.Infrastructure.Log
{
    public class LogHelper
    {
        private static readonly Logger Logger = LogManager.GetCurrentClassLogger();

        private static void SetLoggerVariables()
        {
            LogManager.Configuration.Variables["version"] = new AssemblyInfoService().GetVersion();
        }

        public static void Error(Exception exception)
        {
            if (Logger.IsErrorEnabled)
            {
                SetLoggerVariables();
                Logger.Error(exception);
            }
        }

        public static void Info(string message, Exception exception)
        {
            if (Logger.IsInfoEnabled)
            {
                SetLoggerVariables();
                Logger.Info(exception, message);
            }
        }

        public static void Info(string message)
        {
            if (Logger.IsInfoEnabled)
            {
                SetLoggerVariables();
                Logger.Info(message);
            }
        }
    }
}
