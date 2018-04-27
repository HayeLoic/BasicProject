using System;
using System.Data;
using System.Linq;
using System.Reflection;
using BasicProject.Helpers.Library.Attributes;
using Dapper;

namespace BasicProject.Helpers.Library.Extensions
{
    public static class DapperExtensions
    {
        public static DynamicParameters ToParameters(this object obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            obj.GetType()
               .GetProperties()
               .Where(propertyInfo => propertyInfo.CanRead && propertyInfo.CanWrite && !propertyInfo.GetCustomAttributes(typeof(IgnoreAttribute)).Any())
               .ToList()
               .ForEach(propertyInfo => parameters.Add(propertyInfo.ToDbParameterName(), propertyInfo.ToDbValue(obj), propertyInfo.ToDbType(), ParameterDirection.Input));

            return parameters;
        }

        public static DbType ToDbType(this PropertyInfo propertyInfo)
        {
            string propertyTypeName = Nullable.GetUnderlyingType(propertyInfo.PropertyType) != null
                ? propertyInfo.PropertyType.GenericTypeArguments[0].Name
                : propertyInfo.PropertyType.Name;

            return (DbType)Enum.Parse(typeof(DbType), propertyTypeName);
        }

        public static object ToDbValue(this PropertyInfo propertyInfo, object obj)
        {
            return propertyInfo.GetValue(obj, null) ?? DBNull.Value;
        }

        public static string ToDbParameterName(this PropertyInfo propertyInfo)
        {
            char[] propertyName = (typeof(Nullable<>).IsAssignableFrom(propertyInfo.PropertyType)
                ? propertyInfo.PropertyType.GetGenericArguments()[0].Name
                : propertyInfo.Name).ToCharArray();

            if (char.IsUpper(propertyName[0]))
            {
                propertyName[0] = char.ToLowerInvariant(propertyName[0]);
            }

            return new string(propertyName);
        }
    }
}