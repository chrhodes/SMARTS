using System;
using System.Collections.Generic;
using System.Text;
using Excel = Microsoft.Office.Interop.Excel;
using Office = Microsoft.Office.Core;

namespace SMARTS_Excel
{
    class ExcelUtil
    {
        public static void GetLastRowCol(Excel.Worksheet ws, ref int lastRow, ref int lastCol)
        {
            lastCol = ws.Cells.SpecialCells(Excel.XlCellType.xlCellTypeLastCell, Excel.XlSpecialCellsValue.xlTextValues).Column;
            lastRow = ws.Cells.SpecialCells(Excel.XlCellType.xlCellTypeLastCell, Excel.XlSpecialCellsValue.xlTextValues).Row;
        }
    }
}
