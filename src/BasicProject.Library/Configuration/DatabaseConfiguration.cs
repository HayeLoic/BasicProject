using System.Configuration;

namespace BasicProject.Library.Configuration
{
    public class DatabaseConfiguration: IDatabaseConfiguration
    {
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["xxxxxxx"].ConnectionString;
        }
    }
}
