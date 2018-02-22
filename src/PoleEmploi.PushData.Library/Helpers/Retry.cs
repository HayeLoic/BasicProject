using System;
using System.Collections.Generic;
using System.Threading;

namespace BasicProject.Library.Helpers
{
    public class Retry
    {
        public static void Do(Action action, TimeSpan retryInterval, int retryCount = 3)
        {
            Do<object>(() =>
            {
                action();
                return null;
            }, retryInterval, retryCount);
        }

        public static T Do<T>(Func<T> action, TimeSpan retryInterval, int retryCount = 3)
        {
            List<Exception> exceptions = new List<Exception>();

            for (int retry = 0; retry < retryCount; retry++)
            {
                try
                {
                    return action();
                }
                catch (Exception ex)
                {
                    exceptions.Add(ex);
                    Thread.Sleep(retryInterval);
                }
            }

            throw new AggregateException(exceptions);
        }
    }
}