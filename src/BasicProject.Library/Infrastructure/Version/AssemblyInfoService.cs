using System;
using System.Linq;
using System.Reflection;

namespace BasicProject.Library.Infrastructure.Version
{
    public class AssemblyInfoService: IAssemblyInfoService
    {
        public string GetInformationalVersion()
        {
            const string defaultVersionValue = "vDev";
            string informationalVersionFilledByTargetFileOnBuild;

            try
            {
                informationalVersionFilledByTargetFileOnBuild = typeof(AssemblyInfoService)
                    .Assembly
                    .GetCustomAttribute<AssemblyInformationalVersionAttribute>()
                    .InformationalVersion;
            }
            catch
            {
                informationalVersionFilledByTargetFileOnBuild = defaultVersionValue;
            }

            return informationalVersionFilledByTargetFileOnBuild;
        }

        public string GetVersion()
        {
            string informationalVersionFilledByTargetFileOnBuild = GetInformationalVersion();

            return informationalVersionFilledByTargetFileOnBuild.Contains("--")
                ? informationalVersionFilledByTargetFileOnBuild.Split(new[] { "--" }, StringSplitOptions.None).First()
                : informationalVersionFilledByTargetFileOnBuild;
        }

        public string GetCommitSha1AndDate()
        {
            string informationalVersionFilledByTargetFileOnBuild = GetInformationalVersion();

            return informationalVersionFilledByTargetFileOnBuild.Contains("--")
                ? informationalVersionFilledByTargetFileOnBuild.Split(new[] { "--" }, StringSplitOptions.None).Last()
                : informationalVersionFilledByTargetFileOnBuild;
        }
    }
}