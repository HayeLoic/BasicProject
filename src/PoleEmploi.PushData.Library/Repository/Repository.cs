using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using BasicProject.Library.Configuration;
using BasicProject.Library.Dto;
using Dapper;

namespace BasicProject.Library.Repository
{
    public class Repository : IRepository
    {
        public IDatabaseConfiguration DatabaseConfiguration { get; }
        private const string SpGetSampleSampleObjects = "GetSampleSampleObjects";

        public Repository(IDatabaseConfiguration databaseConfiguration)
        {
            this.DatabaseConfiguration = databaseConfiguration;
        }

        public IEnumerable<SampleObject> GetSampleSampleObjects(string parameter)
        {
            DynamicParameters dynamicParameters = new DynamicParameters();
            dynamicParameters.Add("@parameter", parameter);

            using (SqlConnection sqlConnection = new SqlConnection(this.DatabaseConfiguration.GetConnectionString()))
            {
                return sqlConnection.Query<SampleObject>(SpGetSampleSampleObjects, dynamicParameters, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
