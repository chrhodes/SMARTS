using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using Microsoft.VisualStudio.Tools.Applications.Runtime;
using Excel = Microsoft.Office.Interop.Excel;
using Office = Microsoft.Office.Core;
using PacificLife.Life.Enterprise.Data;
using PacificLife.Life.Enterprise.Log;

namespace SMARTS_Excel
{
    public partial class Export
    {
        private int row = 6; // Starting Row in Excel

        private void Export_Startup(object sender, global::System.EventArgs e)
        {
        }

        private void Export_Shutdown(object sender, global::System.EventArgs e)
        {
        }

        #region VSTO Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InternalStartup()
        {
            this.btnExport.Click += new global::System.EventHandler(this.btnExport_Click);
            this.Shutdown += new global::System.EventHandler(this.Export_Shutdown);
            this.Startup += new global::System.EventHandler(this.Export_Startup);

        }

        #endregion

        private void btnExport_Click(object sender, global::System.EventArgs e)
        {
            PLDbConnection dbConn;
            PLDbCommand dbCmd;
            string sqlCmd;
            DataTable dbTable;
            DataTableReader dbTableReader;
            Excel.Worksheet ws = (Excel.Worksheet)Application.ActiveSheet;
            Excel.Range rng;

            Application.ScreenUpdating = false;
            Logging.Log(Severity.Verbose, "btnExport_Click");
            dbConn = DataAccess.ConnectionOpen();
            rng = (Excel.Range)ws.Cells[3, 1];
            sqlCmd = "EXEC GetItem " + Globals.TABLE_SHAPE + "," + rng.Value2;
            dbCmd = new PLDbCommand(sqlCmd, dbConn);
            dbTable = dbCmd.ExecuteDataTable();

            Logging.Log(Severity.Verbose, "After ExecuteDataTable");
            dbTableReader = dbTable.CreateDataReader();
            Logging.Log(Severity.Verbose, "After CreateDataReader");

            for (int j = 0 ; j < dbTable.Rows.Count; j++, row++)
            {
                dbTableReader.Read();

                for (int i = 0; i < dbTableReader.FieldCount; i++) // fields are zero based
                {

                    rng = (Excel.Range)ws.Cells[row, i + 1];
                    rng.Value2 = dbTableReader.GetValue(i).ToString();
                    //(Excel.Range)ws.Cells[i, j].Value2 = dbTableReader.GetValue(i).ToString();
                    //MessageBox.Show(dbTableReader.GetValue(i).ToString());
                }
            }

            //MessageBox.Show(dbTableReader.GetValue(1).ToString() + " " + dbTableReader.GetValue(2).ToString() + " " + dbTableReader.GetValue(3).ToString());
            //MessageBox.Show(dbTable.Rows.ToString());
            //dbDataSet = dbCmd.ExecuteDataSet();
            Logging.Log(Severity.Verbose, "After for loops");
            dbConn.Close();
            Logging.Log(Severity.Verbose, "After dbClose");
            Application.ScreenUpdating = true;
        }

    }
}
