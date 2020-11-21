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
    public partial class Object : PageBase
    {

        protected void  Page_Load(System.Object sender, System.EventArgs e)
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
	        urlHistory.NavigateUrl = "history.aspx?page=object.aspx&id=" + Request.QueryString["id"] + "&type=" + Request.QueryString["type"];
            //SqlDataReader reader;
            SqlCommand sqlCmd;
            DataTable sqlTable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter();

            string strSQL = String.Format("EXEC GetItem {0},{1}", Common.TABLE_SHAPE, Request.QueryString["id"]);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdLifecycle.DataSource = sqlTable;
	        grdLifecycle.DataBind();
	        grdDescription.DataSource = sqlTable;
	        grdDescription.DataBind();

            strSQL = String.Format("EXEC GetItem_Container {0},{1},{2}", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_SYSTEMOBJECT);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdName.DataSource = sqlTable;
	        grdName.DataBind();

            strSQL = String.Format("EXEC GetItem_AttributeValue {0},{1},NULL ", Common.TABLE_SHAPE, Request.QueryString["id"]);
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
            //sqlTable = sqlCmd.ExecuteDataTable;
            //grdArtifacts.DataSource = sqlTable;
            //grdArtifacts.DataBind();

            strSQL = String.Format("EXEC GetItem_Relation NULL,{0},{1},{2}", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_OBJECT);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdRelations.DataSource = sqlTable;
	        grdRelations.DataBind();

            strSQL = String.Format("EXEC GetItem_Container {0},{1},{2}", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_DEVICEOBJECT);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdDeviceObject.DataSource = sqlTable;
	        grdDeviceObject.DataBind();

            strSQL = String.Format("EXEC GetItem_Container {0},{1},{2}", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_STEPOBJECT);
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