using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Smarts3
{
    public static class SystemDataExtensionMethods
    {
        public static DataSet ExecuteDataSet(this SqlCommand sqlCmd, SqlConnection sqlConn)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd.CommandText, sqlConn);
            DataSet resultDataSet = new DataSet();
            dataAdapter.Fill(resultDataSet);

            return resultDataSet;
        }

        public static DataTable ExecuteDataTable(this SqlCommand sqlCmd, SqlConnection sqlConn)
        {
            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd.CommandText, sqlConn);
            DataTable resultTable = new DataTable();
            dataAdapter.Fill(resultTable);

            return resultTable;
        }
    }
}
