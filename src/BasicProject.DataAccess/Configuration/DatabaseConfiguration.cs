using System.Configuration;
using BasicProject.Library.Configuration;

namespace BasicProject.DataAccess.Configuration
{
    public class DatabaseConfiguration: IDatabaseConfiguration
    {
        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["xxxxxxx"].ConnectionString;
        }
    }
}
