namespace BasicProject.Library.Configuration
{
    public interface IApplicationSettings
    {
        string StringSetting { get; set; }
        int IntSetting { get; set; }
    }
}