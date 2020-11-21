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
    public partial class Relation : PageBase
    {

        private void Page_Load(System.Object sender, System.EventArgs e)
        {

	        if (!Page.IsPostBack)
            {
		        lblRelationID.Text = Request.QueryString["relation"];
		        SqlConnection sqlConn = SMARTSConnectionOpen();
		        DataBindPage(sqlConn);
		        sqlConn.Close();
	        }
        }

        private DataTable CreateRelationsTable(SqlConnection sqlConn)
        {
	        DataTable dtTable = new DataTable("Data");
	        dtTable.Columns.Add(new DataColumn("Assoc_Direction", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("Assoc_AbstractionID", typeof(int)));
	        dtTable.Columns.Add(new DataColumn("Principal_ID", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("Principal_Name", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("Principal_TypeID", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("Principal_TypeName", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("PrincipalContainer_ID", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("PrincipalContainer_Name", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("PrincipalContainer_TypeID", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("PrincipalContainer_TypeName", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("Related_ID", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("Related_Name", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("Related_TypeID", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("Related_TypeName", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("RelatedContainer_ID", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("RelatedContainer_Name", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("RelatedContainer_TypeID", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("RelatedContainer_TypeName", typeof(string)));

	        dtTable.AcceptChanges();

	        DataRow dtRow = dtTable.NewRow();

            //SqlDataReader reader;
            SqlCommand sqlCmd;
            DataTable sqlTable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter();
            string strSQL;

	        //--- GET THE RELATION INFO FIRST
	        //        Dim strSQL As String = "EXEC GetItem_Relation " & lblRelationID.Text & "," & Common.TABLE_SHAPE & "," & Request.QueryString["id"] & ", NULL "
            strSQL = String.Format("EXEC GetItem_Relation {0}, NULL, NULL, NULL", lblRelationID.Text);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
            DataRow sourceRow = sqlTable.Rows[0];
            
            dtRow["Assoc_Direction"] = sqlTable.Rows[0].Field<string>("Assoc_Direction");
            dtRow["Assoc_AbstractionID"] = sqlTable.Rows[0].Field<int>("Assoc_AbstractionID");
	        dtRow["Principal_ID"] = sqlTable.Rows[0].Field<string>("Principal_ID");
	        dtRow["Principal_Name"] = sqlTable.Rows[0].Field<string>("Principal_Name");
	        dtRow["Principal_TypeID"] = sqlTable.Rows[0].Field<string>("Principal_TypeID");
	        dtRow["Principal_TypeName"] = sqlTable.Rows[0].Field<string>("Principal_TypeName");
	        dtRow["PrincipalContainer_ID"] = sqlTable.Rows[0].Field<string>("PrincipalContainer_ID");
	        dtRow["PrincipalContainer_Name"] = sqlTable.Rows[0].Field<string>("PrincipalContainer_Name");
	        dtRow["PrincipalContainer_TypeID"] = sqlTable.Rows[0].Field<string>("PrincipalContainer_TypeID");
	        dtRow["PrincipalContainer_TypeName"] = sqlTable.Rows[0].Field<string>("PrincipalContainer_TypeName");
	        dtRow["Related_ID"] = sqlTable.Rows[0].Field<string>("Related_ID");
	        dtRow["Related_Name"] = sqlTable.Rows[0].Field<string>("Related_Name");
	        dtRow["Related_TypeID"] = sqlTable.Rows[0].Field<string>("Related_TypeID");
	        dtRow["Related_TypeName"] = sqlTable.Rows[0].Field<string>("Related_TypeName");
	        dtRow["RelatedContainer_ID"] = sqlTable.Rows[0].Field<string>("RelatedContainer_ID");
	        dtRow["RelatedContainer_Name"] = sqlTable.Rows[0].Field<string>("RelatedContainer_Name");
	        dtRow["RelatedContainer_TypeID"] = sqlTable.Rows[0].Field<string>("RelatedContainer_TypeID");
	        dtRow["RelatedContainer_TypeName"] = sqlTable.Rows[0].Field<string>("RelatedContainer_TypeName");

	        dtTable.Rows.Add(dtRow);
	        dtTable.AcceptChanges();

	        return dtTable;

        }

        //--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS

        public void DataBindPage(SqlConnection sqlConn)
        {
            //SqlDataReader reader;
            SqlCommand sqlCmd;
            DataTable sqlTable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter();
            string strSQL;

	        strSQL = "EXEC GetItem_Relation " + lblRelationID.Text + ", NULL, NULL, NULL ;";
	        //If Len(Request.QueryString["id"]) = Common.EMPTY_INT Then
	        //    strSQL = "EXEC GetItem_Relation " & lblRelationID.Text & "," & Common.TABLE_SHAPE & ", NULL, NULL ;"
	        //Else
	        //    strSQL = "EXEC GetItem_Relation " & lblRelationID.Text & "," & Common.TABLE_SHAPE & "," & Request.QueryString["id"] & ", NULL ;"
	        //End If
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
            sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
            //reader = sqlCmd.ExecuteReader();
            //sqlTable.Load(reader);
            //dataAdapter.SelectCommand = sqlCmd;
            //dataAdapter.SelectCommand.Connection = sqlConn;
            //dataAdapter.Fill(sqlTable);
	        grdName.DataSource = sqlTable;
	        grdName.DataBind();
	        grdDescription.DataSource = sqlTable;
	        grdDescription.DataBind();

	        sqlTable = CreateRelationsTable(sqlConn);
	        grdRelations.DataSource = sqlTable;
	        grdRelations.DataBind();
	        HyperLink urlPrincipalID = (HyperLink)grdRelations.Items[0].Cells[0].FindControl("urlRelationPrincipal");
	        HyperLink urlRelatedID = (HyperLink)grdRelations.Items[0].Cells[0].FindControl("urlRelationRelated");
	        HyperLink urlPrincipalContainerID = (HyperLink)grdRelations.Items[0].Cells[0].FindControl("urlRelationPrincipalContainer");
	        HyperLink urlRelatedContainerID = (HyperLink)grdRelations.Items[0].Cells[0].FindControl("urlRelationRelatedContainer");

	        switch (int.Parse(sqlTable.Rows[0].Field<string>("Assoc_AbstractionID")))
            {
		        case Common.ABSTRACTION_DEVICE:
                    urlPrincipalID.NavigateUrl = String.Format("device.aspx?id={0}&type={1}", sqlTable.Rows[0].Field<string>("Principal_ID"), sqlTable.Rows[0].Field<string>("Principal_TypeID"));
                    urlRelatedID.NavigateUrl = String.Format("device.aspx?id={0}&type={1}", sqlTable.Rows[0].Field<string>("Related_ID"), sqlTable.Rows[0].Field<string>("Related_TypeID"));
			        break;

                case Common.ABSTRACTION_OBJECT:
                    urlPrincipalID.NavigateUrl = String.Format("object.aspx?id={0}&type={1}", sqlTable.Rows[0].Field<string>("Principal_ID"), sqlTable.Rows[0].Field<string>("Principal_TypeID"));
                    urlRelatedID.NavigateUrl = String.Format("object.aspx?id={0}&type={1}", sqlTable.Rows[0].Field<string>("Related_ID"), sqlTable.Rows[0].Field<string>("Related_TypeID"));
                    urlPrincipalContainerID.NavigateUrl = String.Format("sys.aspx?id={0}&type={1}", sqlTable.Rows[0].Field<string>("PrincipalContainer_ID"), sqlTable.Rows[0].Field<string>("PrincipalContainer_TypeID"));
                    urlRelatedContainerID.NavigateUrl = String.Format("sys.aspx?id={0}&type={1}", sqlTable.Rows[0].Field<string>("RelatedContainer_ID"), sqlTable.Rows[0].Field<string>("RelatedContainer_TypeID"));
			        break;

                case Common.ABSTRACTION_STEP:
                    urlPrincipalID.NavigateUrl = String.Format("step.aspx?id={0}&type={1}", sqlTable.Rows[0].Field<string>("Principal_ID"), sqlTable.Rows[0].Field<string>("Principal_TypeID"));
                    urlRelatedID.NavigateUrl = String.Format("step.aspx?id={0}&type={1}", sqlTable.Rows[0].Field<string>("Related_ID"), sqlTable.Rows[0].Field<string>("Related_TypeID"));
                    urlPrincipalContainerID.NavigateUrl = String.Format("businessprocess.aspx?id={0}&type={1}", sqlTable.Rows[0].Field<string>("PrincipalContainer_ID"), sqlTable.Rows[0].Field<string>("PrincipalContainer_TypeID"));
                    urlRelatedContainerID.NavigateUrl = String.Format("businessprocess.aspx?id={0}&type={1}", sqlTable.Rows[0].Field<string>("RelatedContainer_ID"), sqlTable.Rows[0].Field<string>("RelatedContainer_TypeID"));
			        break;
	        }

            strSQL = String.Format("EXEC GetItem_AttributeValue {0},{1}, NULL ;", Common.TABLE_RELATION, lblRelationID.Text);
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
	        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
	        grdAttribute.DataSource = sqlTable;
	        grdAttribute.DataBind();

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