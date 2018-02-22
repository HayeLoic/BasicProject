using System.Data;
using System.Data.SqlClient;

namespace BasicProject.Library.Helpers
{
    public class BulkCopy
    {
        public static void SqlBulkCopy(string destTableName, DataTable data, string connexionString, int sqlCommandTimeout)
        {
            using (SqlConnection connection = new SqlConnection(connexionString))
            {
                SqlBulkCopy bulkCopy =
                new SqlBulkCopy
                (
                    connection,
                    SqlBulkCopyOptions.TableLock,
                    null
                );

                foreach (DataColumn dataColumn in data.Columns)
                {
                    bulkCopy.ColumnMappings.Add(dataColumn.ColumnName, dataColumn.ColumnName);
                }
                bulkCopy.BulkCopyTimeout = sqlCommandTimeout;
                bulkCopy.BatchSize = 20000;
                bulkCopy.DestinationTableName = destTableName;

                connection.Open();
                bulkCopy.WriteToServer(data);
                connection.Close();
            }
        }
    }
}