using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using System.Reflection;
using Microsoft.VisualStudio.Tools.Applications.Runtime;
using Excel = Microsoft.Office.Interop.Excel;
using Office = Microsoft.Office.Core;
using PacificLife.Life.Enterprise.Data;
using PacificLife.Life.Enterprise.Log;
using System.Collections.Generic;

namespace SMARTS_Excel
{
    public partial class Import
    {
        private void Sheet2_Startup(object sender, global::System.EventArgs e)
        {
        }

        private void Sheet2_Shutdown(object sender, global::System.EventArgs e)
        {
        }

        #region VSTO Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InternalStartup()
        {
            this.btnImport.Click += new global::System.EventHandler(this.btnImport_Click);
            this.Shutdown += new global::System.EventHandler(this.Sheet2_Shutdown);
            this.Startup += new global::System.EventHandler(this.Sheet2_Startup);

        }

        #endregion

        private void btnImport_Click(object sender, global::System.EventArgs e)
        {
            Logging.Log(Severity.Verbose, global::System.Reflection.MethodBase.GetCurrentMethod().Name); 
            PLDbConnection dbConn;


            Excel.Worksheet ws = (Excel.Worksheet)Application.ActiveSheet;
            Excel.Range rngName, rngDescription, rngID;
            Excel.Range rngAttributeName, rngAttributeValue;
            Excel.Range rngShapeTypeName;
            string shapeTypeAttributeName;
            int lastRow = 0, lastCol = 0;

            if (ValidateImportWorkSheet(ws, ref lastRow, ref lastCol))
            {
                try
                {
                    Application.ScreenUpdating = false;

                    // TODO : Ask Aaron if have to explicitly call Close()
                    using (dbConn = DataAccess.ConnectionOpen())
                    {
                        int shapeID;

                        for (int j = Globals.IMPORT_FIRST_DATA_ROW; j <= lastRow; j++)
                        {
                            // Create the shape
                            
                            rngShapeTypeName = (Excel.Range)ws.Cells[j, Globals.IMPORT_SHAPETYPENAME_COLUMN];
                            rngName = (Excel.Range)ws.Cells[j, Globals.IMPORT_NAME_COLUMN];
                            rngDescription = (Excel.Range)ws.Cells[j, Globals.IMPORT_DESCRIPTION_COL];
                            string shapeTypeName = rngShapeTypeName.Value2.ToString();

                            if ( Globals.SUCCESS != DataAccess.CreateShape(
                                    dbConn,
                                    shapeTypeName,
                                    rngName.Value2.ToString(),
                                    rngDescription.Value2.ToString(),
                                    out shapeID)
                                )
                            {
                                MessageBox.Show("CreateShape failed");
                            }

                            // TODO: Figure out how to do offsets from ranges.  Having to get a range
                            // for every cell is ugly.
                            rngID = (Excel.Range)ws.Cells[j, Globals.IMPORT_ID_COLUMN];
                            rngID.Value2 = shapeID;

                            // Now that the shape has been created, or verified to exist,
                            // update any attributes that have been specified.
                            for (int k = Globals.IMPORT_FIRST_ATTRIBUTE_COL; k <= lastCol; k++)
                            {
                                rngAttributeName = (Excel.Range)ws.Cells[Globals.IMPORT_ATTRIBUTE_NAMES_ROW, k];

                                if (rngAttributeName.Value2 != null)
                                {
                                    rngAttributeValue = (Excel.Range)ws.Cells[j, k];
                                    shapeTypeAttributeName = rngAttributeName.Value2.ToString() + Globals.ATTRRIBUTENAME_SHAPETYPENAME_SEPARATOR + shapeTypeName;
                                    // This should work.  If haven't validated sheet then may not find attribute.
                                    if (Globals.SUCCESS != DataAccess.UpdateAttribute(dbConn, shapeID, shapeTypeAttributeName, rngAttributeValue.Value2.ToString()))
                                    {
                                        MessageBox.Show("UpdateAttribute failed");
                                    }
                                }
                            }
                        }
                    }
                }
                finally
                {
                    // Ensure we always turn screen back on by putting this in finally
                    Application.ScreenUpdating = true;
                }
            }
            else
            {
                MessageBox.Show("Sheet contains errors.  Correct and click 'Errors Corrected'");
            }
        }

        // Validate the sheet will successfully Import.  Check the following things
        //  Attribute names
        //  ShapeType names
        //  ShapeTypeAttribute names

        // Visually hilight any problems and change the "Import Button" to "ReSubmit"
        // If all is ok, change the button back to "Import"
        // Think through how best to traverse the sheet.  Should the attributes be validated,
        // then the ShapeTypes, then the ShapeTypeAttributes?  Don't want to keep rubbing people's nose
        // in same problem.

        private bool ValidateImportWorkSheet(Excel.Worksheet ws, ref int lastRow, ref int lastCol)
        {
            Excel.Range rngShapeTypeName, rngAttributeName;
            string attributeName, shapeTypeAttributeName;
            bool validSheet = true;

            // Determine the last populated row.
            // TODO: Make this (optionally??) take a column to search for the last.
            // Perhaps a GetLastRow and GetLastCol that take a row/column to search.

            ExcelUtil.GetLastRowCol(ws, ref lastRow, ref lastCol);

            // Verify all attributes are valid.

            for (int k = Globals.IMPORT_FIRST_ATTRIBUTE_COL; k <= lastCol; k++)
            {
                rngAttributeName = (Excel.Range)ws.Cells[Globals.IMPORT_ATTRIBUTE_NAMES_ROW, k];

                // Ignore columns with no attribute name.
                if (rngAttributeName.Value2 != null)
                {
                    // Verify attribute is valid.

                    attributeName = rngAttributeName.Value2.ToString();

                    if (!Globals.Attributes.ContainsKey(attributeName))
                    {
                        MessageBox.Show("Unrecognized Attribute: " + attributeName);
                        // TODO : Hilight cell.
                        validSheet = false;
                        continue;
                    }
                }
            }

            if ( ! validSheet)
            {
                return validSheet;
            }

            for (int j = Globals.IMPORT_FIRST_DATA_ROW; j <= lastRow; j++)
            {
                // Verify legal SHAPETYPES have been specified.

                rngShapeTypeName = (Excel.Range)ws.Cells[j, Globals.IMPORT_SHAPETYPENAME_COLUMN];
                string shapeTypeName = rngShapeTypeName.Value2.ToString();
                
                
                if ( ! Globals.ShapeTypes.ContainsKey(shapeTypeName))
                {
                    MessageBox.Show("Unrecognized Shape Type: " + shapeTypeName );
                    // Hilight Row
                    validSheet = false;
                    continue;
                }

                // Verify all attributes exist.  This should be a combination of legal attribute
                // and exists on shape.

                for (int k = Globals.IMPORT_FIRST_ATTRIBUTE_COL; k <= lastCol; k++)
                {
                    rngAttributeName = (Excel.Range)ws.Cells[Globals.IMPORT_ATTRIBUTE_NAMES_ROW, k];

                    // Ignore columns with no attribute name.
                    if (rngAttributeName.Value2 != null)
                    {
                        attributeName = rngAttributeName.Value2.ToString();

                        // Verify attribute applies to shape.  (We already verified attribute is valid)

                        shapeTypeAttributeName = attributeName + Globals.ATTRRIBUTENAME_SHAPETYPENAME_SEPARATOR + shapeTypeName;

                        if ( ! Globals.ShapeTypeAttributes.ContainsKey(shapeTypeAttributeName))
                        {
                            MessageBox.Show("Unrecognized ShapeTypeAttribute: " + shapeTypeAttributeName + "  Has the attribute been added to the shape?");
                            // Hilight something.
                            validSheet = false;
                        }
                    }
                }
            }

            return validSheet;
        }
    }
}
