using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using BasicProject.Library.Attributes;

namespace BasicProject.Library.Extensions
{
    public static class DataTableExtension
    {
        public static DataTable ToDataTable<T>(this IList<T> data)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(T));
            DataTable dataTable = new DataTable();
            foreach (PropertyDescriptor property in properties)
            {
                if (!property.Attributes.OfType<IgnoreAttribute>().Any())
                {
                    dataTable.Columns.Add(property.Name, Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType);
                }
            }
            foreach (T item in data)
            {
                DataRow dataRow = dataTable.NewRow();
                foreach (PropertyDescriptor property in properties)
                {
                    if (!property.Attributes.OfType<IgnoreAttribute>().Any())
                    {
                        dataRow[property.Name] = property.GetValue(item) ?? DBNull.Value;
                    }
                }
                dataTable.Rows.Add(dataRow);
            }
            return dataTable;
        }
    }
}