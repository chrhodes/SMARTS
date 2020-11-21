using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using Microsoft.VisualStudio.Tools.Applications.Runtime;
using Excel = Microsoft.Office.Interop.Excel;
using Office = Microsoft.Office.Core;

namespace SMARTS_Excel
{
    public partial class ThisWorkbook
    {
        private void ThisWorkbook_Startup(object sender, global::System.EventArgs e)
        {
        }

        private void ThisWorkbook_Shutdown(object sender, global::System.EventArgs e)
        {
        }

        #region VSTO Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InternalStartup()
        {
            this.Startup += new global::System.EventHandler(ThisWorkbook_Startup);
            this.Shutdown += new global::System.EventHandler(ThisWorkbook_Shutdown);
        }

        #endregion

    }
}
