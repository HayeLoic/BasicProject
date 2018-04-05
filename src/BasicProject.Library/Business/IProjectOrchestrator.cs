namespace BasicProject.Library.Business
{
    public interface IProjectOrchestrator
    {
        int GetExecuteIntervalInMilliseconds();
        void Execute();
    }
}
