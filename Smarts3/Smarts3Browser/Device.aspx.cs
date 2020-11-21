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
    public partial class Device : PageBase
    {

        protected void Page_Load(System.Object sender, System.EventArgs e)
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

            urlHistory.NavigateUrl = String.Format("history.aspx?page=device.aspx&id={0}&type={1}", Request.QueryString["id"], Request.QueryString["type"]);

            strSQL = String.Format("EXEC GetItem {0},{1};", Common.TABLE_SHAPE, Request.QueryString["id"]);
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

            strSQL = String.Format("EXEC GetItem_Contained {0},{1},{2};", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_IP);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdAddress.DataSource = sqlTable;
	        grdAddress.DataBind();

            strSQL = String.Format("EXEC GetItem_AttributeValue {0},{1},NULL ;", Common.TABLE_SHAPE, Request.QueryString["id"]);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdAttribute.DataSource = sqlTable;
	        grdAttribute.DataBind();

            //strSQL = String.Format("EXEC GetItem_Contained {0},{1},{2};", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_ARTIFACT);
            //sqlCmd = new SqlCommand(strSQL, sqlConn);
            //sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            ////reader = sqlCmd.ExecuteReader();
            ////sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
            //grdArtifacts.DataSource = sqlTable;
            //grdArtifacts.DataBind();

            strSQL = String.Format("EXEC GetItem_Relation NULL,{0},{1},{2};", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_DEVICE);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdRelations.DataSource = sqlTable;
	        grdRelations.DataBind();

            strSQL = String.Format("EXEC GetItem_Contained {0},{1},{2};", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_DEVICEOBJECT);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdDeviceObject.DataSource = sqlTable;
	        grdDeviceObject.DataBind();

            strSQL = String.Format("EXEC GetItem_Contained {0},{1},{2};", Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_DEVICE);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdContainDevice.DataSource = sqlTable;
	        grdContainDevice.DataBind();

            strSQL = "EXEC GetItem_Container " + Common.TABLE_SHAPE + "," + Request.QueryString["id"] + "," + Common.ABSTRACTION_DEVICE + ";";
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdContainedByDevice.DataSource = sqlTable;
	        grdContainedByDevice.DataBind();

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