namespace BasicProject.Library.Infrastructure.Version
{
    public interface IAssemblyInfoService
    {
        string GetVersion();
        string GetInformationalVersion();
        string GetCommitSha1AndDate();
    }
}
