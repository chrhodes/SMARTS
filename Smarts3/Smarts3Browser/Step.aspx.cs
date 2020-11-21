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
    public partial class Step : PageBase
    {

        private void  // ERROR: Handles clauses are not supported in C#
        Page_Load(System.Object sender, System.EventArgs e)
        {
	        if (!Page.IsPostBack)
            {
		        SqlConnection sqlConn = SMARTSConnectionOpen();
		        DataBindPage(sqlConn);
		        sqlConn.Close();
	        }
        }

        //--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS

        public void DataBindPage(SqlConnection sqlConn)
        {
            //SqlDataReader reader;
            SqlCommand sqlCmd;
            DataTable sqlTable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter();
            string strSQL;

	        urlHistory.NavigateUrl = "history.aspx?page=step.aspx&id=" + Request.QueryString["id"] + "&type=" + Request.QueryString["type"];

            strSQL = "EXEC GetItem " + Common.TABLE_SHAPE + "," + Request.QueryString["id"];
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdDescription.DataSource = sqlTable;
	        grdDescription.DataBind();
	        grdLifecycle.DataSource = sqlTable;
	        grdLifecycle.DataBind();

            strSQL = "EXEC GetItem_Container " + Common.TABLE_SHAPE + "," + Request.QueryString["id"] + "," + Common.ABSTRACTION_BUSINESSSTEP;
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdName.DataSource = sqlTable;
	        grdName.DataBind();

            strSQL = "EXEC GetItem_AttributeValue " + Common.TABLE_SHAPE + "," + Request.QueryString["id"] + ",NULL ";
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdAttribute.DataSource = sqlTable;
	        grdAttribute.DataBind();

            //strSQL = "EXEC GetItem_Contained " + Common.TABLE_SHAPE + "," + Request.QueryString["id"] + "," + Common.ABSTRACTION_ARTIFACT;
            //sqlCmd = new SqlCommand(strSQL, sqlConn);
            ////reader = sqlCmd.ExecuteReader();
            ////sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
            //grdArtifacts.DataSource = sqlTable;
            //grdArtifacts.DataBind();

            strSQL = "EXEC GetItem_Relation NULL," + Common.TABLE_SHAPE + "," + Request.QueryString["id"] + "," + Common.ABSTRACTION_STEP;
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdRelations.DataSource = sqlTable;
	        grdRelations.DataBind();

            strSQL = "EXEC GetItem_Contained " + Common.TABLE_SHAPE + "," + Request.QueryString["id"] + "," + Common.ABSTRACTION_STEPOBJECT;
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdStepObject.DataSource = sqlTable;
	        grdStepObject.DataBind();

	        for (int i = 0; i <= grdAttribute.Items.Count - 1; i++)
            {
		        Label lblValue = (Label)grdAttribute.Items[i].Cells[1].FindControl("lblAttributeValue");
		        HyperLink urlValue = (HyperLink)grdAttribute.Items[i].Cells[1].FindControl("urlAttributeValue");
		        if ((lblValue != null)) 
                {
			        try
                    {
				        Uri u = new Uri(lblValue.Text);
				        urlValue.Visible = true;
				        lblValue.Visible = false;
			        } 
                    catch (UriFormatException )
                    {
				        urlValue.Visible = false;
				        lblValue.Visible = true;
			        }
		        }
	        }
        }
    }
}