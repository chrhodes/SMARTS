using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Smarts3;

namespace Smarts3Browser
{
    public partial class _Default : PageBase
    {

        protected void DataBindControl(object Source, SqlConnection sqlConn)
        {
            DropDownList ddlList = (DropDownList)Source;

	        SqlCommand sqlCmd = default(SqlCommand);
	        DataTable sqlTable = new DataTable();
            SqlDataReader reader;

	        switch (ddlList.ID)
            {
		        case "ddlSearchField":
			        sqlCmd = new SqlCommand("GetAttributeList", sqlConn);
                    reader = sqlCmd.ExecuteReader();
                    sqlTable.Load(reader);

			        ddlList.DataSource = sqlTable;
			        ddlList.DataBind();
			        ddlSearchField.Items.Insert(0, new ListItem("--ALL ATTRIBUTES--"));
			        ddlSearchField.Items.Insert(0, new ListItem("Description"));
			        ddlSearchField.Items.Insert(0, new ListItem("Name"));
			        ddlSearchField.Items.Insert(0, new ListItem("--ALL FIELDS--"));
			        break;

		        case "ddlReportName":
			        ddlReportName.Items.Clear();
                    ddlList.Items.Add(new ListItem("Attributes", Common.EMPTY_INT.ToString()));

                    if (ddlReportLevel.SelectedItem.Value != Common.EMPTY_INT.ToString())
                    {
				        ddlList.Items.Add(new ListItem("Relations", "1"));
			        }
			        break;

		        case "ddlSearchLevel":
		        case "ddlLevelList":
		        case "ddlReportLevel":
			        if (ddlList.ID == "ddlSearchLevel" | ddlList.ID == "ddlReportLevel")
                    {
                        ddlList.Items.Add(new ListItem("--ALL--", Common.EMPTY_INT.ToString()));
			        }
			        ddlList.Items.Add(new ListItem("Business Process", Common.ABSTRACTION_BUSINESS.ToString()));
                    ddlList.Items.Add(new ListItem("Process Step", Common.ABSTRACTION_STEP.ToString()));
                    ddlList.Items.Add(new ListItem("System", Common.ABSTRACTION_SYSTEM.ToString()));
                    ddlList.Items.Add(new ListItem("Object", Common.ABSTRACTION_OBJECT.ToString()));
                    ddlList.Items.Add(new ListItem("Device", Common.ABSTRACTION_DEVICE.ToString()));
			        break;

		        case "ddlSearchType":
			        ddlSearchType.Items.Clear();

                    if (Convert.ToInt32(ddlSearchLevel.SelectedItem.Value) != Common.EMPTY_INT)
                    {
				        sqlCmd = new SqlCommand("GetShapeTypeList " + ddlSearchLevel.SelectedItem.Value, sqlConn);
                        reader = sqlCmd.ExecuteReader();
                        sqlTable.Load(reader);
				        ddlList.DataSource = sqlTable;
				        ddlList.DataBind();
			        }

                    ddlSearchType.Items.Insert(0, new ListItem("--ALL--", Common.EMPTY_INT.ToString()));
			        break;

		        case "ddlTypeList":
			        sqlCmd = new SqlCommand("GetShapeTypeList " + ddlLevelList.SelectedItem.Value, sqlConn);
                    reader = sqlCmd.ExecuteReader();
                    sqlTable.Load(reader);
			        ddlList.DataSource = sqlTable;
			        ddlList.DataBind();
			        break;

		        case "ddlReportShapeType":
			        sqlCmd = new SqlCommand("GetShapeTypeList " + ddlReportLevel.SelectedItem.Value, sqlConn);
                    reader = sqlCmd.ExecuteReader();
                    sqlTable.Load(reader);
			        ddlList.DataSource = sqlTable;
			        ddlList.DataBind();

			        if (ddlReportLevel.SelectedItem.Text == "--ALL--")
                    {
				        ddlList.Items.Add(new ListItem("--ALL--", Common.EMPTY_INT.ToString()));
			        }

			        break;

		        case "ddlList":
			        sqlCmd = new SqlCommand("GetShapeList_Browser " + ddlTypeList.SelectedItem.Value, sqlConn);
                    reader = sqlCmd.ExecuteReader();
                    sqlTable.Load(reader);
			        ddlList.DataSource = sqlTable;
			        ddlList.DataBind();
			        break;
	        }

        }

        private void  Page_Load(System.Object sender, System.EventArgs e)
        {
            SetScroll();


            if (Page.IsPostBack)
            {
                SaveScroll();


            }
            else
            {
                SqlConnection sqlConn = SMARTSConnectionOpen();

                //read results returned
                try
                {
                    DataBindControl(ddlLevelList, sqlConn);
                    DataBindControl(ddlTypeList, sqlConn);
                    DataBindControl(ddlReportLevel, sqlConn);
                    DataBindControl(ddlReportShapeType, sqlConn);
                    DataBindControl(ddlReportName, sqlConn);

                    if (Request.QueryString["id"].Length > 0)
                    {
                        ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString["type"]));
                        DataBindControl(ddlList, sqlConn);
                        ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString["id"]));
                    }
                    else
                    {
                        ddlTypeList.SelectedIndex = 0;
                        DataBindControl(ddlList, sqlConn);
                        ddlList.SelectedIndex = 0;
                        ddlReportShapeType.SelectedIndex = 0;
                        DataBindPage(sqlConn);
                    }

                    DataBindControl(ddlSearchField, sqlConn);
                    DataBindControl(ddlSearchLevel, sqlConn);
                    DataBindControl(ddlSearchType, sqlConn);
                }
                catch (Exception exc)
                {
                    Response.Write(exc.Message);
                }
                finally
                {
                    sqlConn.Close();
                }
            }

        }


        private void  // ERROR: Handles clauses are not supported in C#
        ddlLevelList_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        DataBindControl(ddlTypeList, sqlConn);
	        ddlTypeList.SelectedIndex = 0;
	        DataBindControl(ddlList, sqlConn);
	        ddlList.SelectedIndex = 0;
	        DataBindPage(sqlConn);

	        sqlConn.Close();

        }


        private void  // ERROR: Handles clauses are not supported in C#
        ddlReportLevel_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        DataBindControl(ddlReportShapeType, sqlConn);
	        ddlReportShapeType.SelectedIndex = 0;
	        DataBindControl(ddlReportName, sqlConn);
	        DataBindPage(sqlConn);

	        sqlConn.Close();

        }



        private void  // ERROR: Handles clauses are not supported in C#
        ddlSearchLevel_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        DataBindControl(ddlSearchType, sqlConn);

	        sqlConn.Close();

        }


        private void  // ERROR: Handles clauses are not supported in C#
        ddlTypeList_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        DataBindControl(ddlList, sqlConn);
	        ddlList.SelectedIndex = 0;
	        DataBindPage(sqlConn);

	        sqlConn.Close();

        }



        private void  // ERROR: Handles clauses are not supported in C#
        ddlList_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        DataBindPage(sqlConn);

	        sqlConn.Close();

        }


        public void DataBindPage(SqlConnection sqlConn)
        {
	        lblMessage.Visible = false;

            if (ddlList.Items.Count != Common.EMPTY_INT)
            {
		        string strSQL = "EXEC GetItem " + Common.TABLE_SHAPE + "," + Convert.ToInt32(ddlList.SelectedItem.Value) + ";";
		        SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
                SqlDataReader reader = sqlCmd.ExecuteReader();
                DataTable sqlTable = new DataTable();
		        sqlTable.Load(reader);

			    grdDescription.DataSource = sqlTable;
			    grdDescription.DataBind();

	        }

        }



        private void btnSearchValue_Click(System.Object sender, System.EventArgs e)
        {
	        string strQuery = null;

	        switch (ddlSearchField.SelectedItem.Text)
            {
		        case "--ALL FIELDS--":
                    strQuery = "field=" + Common.EMPTY_INT;
			        strQuery = strQuery + "&attribute=0";
			        break;

		        case "Name":
                    strQuery = "field=" + Common.LOGFUNCTION_SET_NAME;
			        strQuery = strQuery + "&attribute=0";
			        break;

		        case "Description":
                    strQuery = "field=" + Common.LOGFUNCTION_SET_DESCRIPTION;
			        strQuery = strQuery + "&attribute=0";
			        break;

		        case "--ALL ATTRIBUTES--":
                    strQuery = "field=" + Common.LOGFUNCTION_SET_ATTRIBUTEVALUE;
			        strQuery = strQuery + "&attribute=0";
			        break;

		        default:
                    strQuery = "field=" + Common.LOGFUNCTION_SET_ATTRIBUTEVALUE;
			        strQuery = strQuery + "&attribute=" + ddlSearchField.SelectedItem.Value;
			        break;
	        }

	        strQuery = strQuery + "&level=" + ddlSearchLevel.SelectedItem.Value;
	        strQuery = strQuery + "&type=" + ddlSearchType.SelectedItem.Value;
	        strQuery = strQuery + "&value=" + boxSearchValue.Text.Trim().Replace("'", "''");


	        Response.Redirect("Result.aspx?" + strQuery);
        }

        private void ViewDetails_Click(System.Object sender, System.EventArgs e)
        {
	        string strSQL = "EXEC GetItem " + Common.TABLE_SHAPE + "," + Convert.ToInt32(ddlList.SelectedItem.Value) + ";";
	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
            SqlDataReader reader = sqlCmd.ExecuteReader();
	        DataTable sqlTable = new DataTable();
            sqlTable.Load(reader);

	        if (sqlTable.Rows.Count == Common.EMPTY_INT)
            {
		        //GOT NOTHING BACK, GET LIST OF LATEST
		        DataBindControl(ddlList, sqlConn);
		        DataBindPage(sqlConn);
		        lblMessage.Text = "Selection is unavailable. Please select another.";
		        lblMessage.Visible = true;

	        }
            else
            {
		        //*** redirect to page depending on shapetype
		        switch (int.Parse(ddlLevelList.SelectedItem.Value))
                {
                    case Common.ABSTRACTION_OBJECT:
				        Response.Redirect("object.aspx?type=" + ddlTypeList.SelectedItem.Value + "&id=" + ddlList.SelectedItem.Value);
				        break;

                    case Common.ABSTRACTION_SYSTEM:
				        Response.Redirect("sys.aspx?type=" + ddlTypeList.SelectedItem.Value + "&id=" + ddlList.SelectedItem.Value);
				        break;

                    case Common.ABSTRACTION_DEVICE:
				        Response.Redirect("device.aspx?type=" + ddlTypeList.SelectedItem.Value + "&id=" + ddlList.SelectedItem.Value);
				        break;

                    case Common.ABSTRACTION_BUSINESS:
				        Response.Redirect("businessprocess.aspx?type=" + ddlTypeList.SelectedItem.Value + "&id=" + ddlList.SelectedItem.Value);
				        break;

                    case Common.ABSTRACTION_STEP:
				        Response.Redirect("step.aspx?type=" + ddlTypeList.SelectedItem.Value + "&id=" + ddlList.SelectedItem.Value);
				        break;
		        }
	        }

	        sqlConn.Close();
        }

        private void btnViewReport_Click(System.Object sender, System.EventArgs e)
        {
	        //*** redirect to page depending on report selected
	        switch (int.Parse(ddlReportLevel.SelectedItem.Value))
            {
		        case Common.EMPTY_INT:
			        Response.Redirect("enterprise.aspx");
			        break;

		        default:
                    if (int.Parse(ddlReportName.SelectedItem.Value) == Common.EMPTY_INT)
                    {
				        Response.Redirect("reports.aspx?type=" + ddlReportShapeType.SelectedItem.Value + "&shapetypename=" + ddlReportShapeType.SelectedItem.Text);
			        } else {
				        Response.Redirect("LevelReports.aspx?abstraction=" + ddlReportLevel.SelectedItem.Value);
			        }

			        break;
	        }
        }

    }
}
