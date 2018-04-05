using System.Configuration;

namespace BasicProject.Library.Configuration
{
    public class ApplicationSettings: IApplicationSettings
    {
        public string StringSetting { get; set; }
        public int IntSetting { get; set; }

        public ApplicationSettings()
        {
            this.StringSetting = ConfigurationManager.AppSettings["StringSetting"] ?? string.Empty;
            this.IntSetting = int.Parse(ConfigurationManager.AppSettings["IntSetting"] ?? "60");
        }
    }
}