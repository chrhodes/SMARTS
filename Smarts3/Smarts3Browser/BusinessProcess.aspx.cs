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
    public partial class BusinessProcess : PageBase
    {

        private void Page_Load(System.Object sender, System.EventArgs e)
        {
	        if (!Page.IsPostBack)
            {
		        SqlConnection sqlConn = SMARTSConnectionOpen();
		        DataBindPage(sqlConn);
		        sqlConn.Close();
	        }
        }

        //--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS

        protected void DataBindPage(SqlConnection sqlConn)
        {
            //SqlDataReader reader;
            SqlCommand sqlCmd;
            DataTable sqlTable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter();
            string strSQL;

	        urlHistory.NavigateUrl = "history.aspx?page=businessprocess.aspx&id=" + Request.QueryString["id"] + "&type=" + Request.QueryString["type"];

            strSQL = String.Format("EXEC GetItem {0},{1}", Common.TABLE_SHAPE, Request.QueryString["id"]);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdDescription.DataSource = sqlTable;
	        grdDescription.DataBind();
	        grdDescription.Visible = true;
	        grdLifecycle.DataSource = sqlTable;
	        grdLifecycle.DataBind();
	        grdLifecycle.Visible = true;

            strSQL = String.Format("EXEC GetItem_AttributeValue {0},{1},NULL", Common.TABLE_SHAPE, Request.QueryString["id"]);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdAttribute.DataSource = sqlTable;
	        grdAttribute.DataBind();
	        grdAttribute.Visible = true;

            //strSQL = String.Format("EXEC GetItem_Contained {0},{1},{2}", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_ARTIFACT);
            //sqlCmd = new SqlCommand(strSQL, sqlConn);
            ////reader = sqlCmd.ExecuteReader();
            ////sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
            ////grdArtifacts.DataBind();
            ////grdArtifacts.Visible = true;

            strSQL = String.Format("EXEC GetItem_Contained {0},{1},{2}", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_BUSINESSSTEP);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
            grdSteps.DataSource = sqlTable;
	        grdSteps.DataBind();
	        grdSteps.Visible = true;

            strSQL = String.Format("EXEC GetItem_Relation NULL,{0},{1},{2}", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_BUSINESS);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
            grdRelations.DataSource = sqlTable;
	        grdRelations.DataBind();
	        grdRelations.Visible = true;

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
            // TODO(crhodes): Figure this out.
            //Label lblLifecycle = (Label)grdLifecycle.Items[0].Cells[1].FindControl("lblLifecycle_ID");

        }
    }
}