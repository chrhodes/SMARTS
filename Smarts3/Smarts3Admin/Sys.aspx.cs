﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Smarts3;

namespace Smarts3Admin
{
    public partial class Sys : PageBase
    {
        protected void DataBindControl(object Source, SqlConnection sqlConn)
        {
            DropDownList ddlList = (DropDownList)Source;

	        SqlCommand sqlCmd = default(SqlCommand);
	        DataTable sqlTable = new DataTable();

            switch (ddlList.ID)
            {
		        case "grdName":
			        if (ddlList.SelectedIndex == Common.EMPTY_INT)
                    {
				        sqlTable = CreateDataTable();
			        }
                    else
                    {
				        sqlCmd = new SqlCommand("GetItem " + Common.TABLE_SHAPE + "," + ddlList.SelectedItem.Value, sqlConn);
				        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        }
			        break;

		        case "ddlList":
			        sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_SYSTEM + ",NULL", sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdDescription":
		        case "grdLifecycle":
			        sqlCmd = new SqlCommand("GetItem " + Common.TABLE_SHAPE + "," + ddlList.SelectedItem.Value, sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdAttribute":
			        sqlCmd = new SqlCommand("GetItem_AttributeValue " + Common.TABLE_SHAPE + "," + ddlList.SelectedItem.Value + ",NULL", sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdArtifacts":
			        sqlCmd = new SqlCommand("GetItem_Contained " + Common.TABLE_SHAPE + "," + ddlList.SelectedItem.Value + "," + Common.ABSTRACTION_ARTIFACT, sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdObjects":
			        sqlCmd = new SqlCommand("GetItem_Contained " + Common.TABLE_SHAPE + "," + ddlList.SelectedItem.Value + "," + Common.ABSTRACTION_SYSTEMOBJECT, sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdRelations":
                    sqlCmd = new SqlCommand(String.Format("GetItem_Relation NULL,{0},{1},{2}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_SYSTEM), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;
	        }

            ddlList.DataSource = sqlTable;
            ddlList.DataBind();

            switch (ddlList.ID)
            {
		        case "ddlList":
			        ddlList.Items.Insert(0, CreateListItem("CREATE NEW SYSTEM"));
			        break;
		        case "grdAttribute":
			        int i = 0;
                    for (i = 0; i <= ddlList.Items.Count - 1; i++)
                    {
                        //Label lblValue = (Label)ddlList.Items[i].Cells[2].FindControl("lblAttributeValue");
                        //HyperLink urlValue = (HyperLink)ddlList.Items[i].Cells[2].FindControl("urlAttributeValue");
                        Label lblValue = (Label)ddlList.FindControl("lblAttributeValue");
                        HyperLink urlValue = (HyperLink)ddlList.FindControl("urlAttributeValue");

				        if ((lblValue != null))
                        {
					        try
                            {
						        Uri u = new Uri(lblValue.Text);
						        urlValue.Visible = true;
						        lblValue.Visible = false;
					        } 
                            catch (UriFormatException ex)
                            {
						        urlValue.Visible = false;
						        lblValue.Visible = true;
					        }
				        }
			        }

			        break;
	        }

        }


        private void ToggleEditColumn(int intValue)
        {
	        if (intValue == Common.LIFECYCLE_RETIRE)
            {
		        grdName.Columns[0].Visible = false;
		        grdDescription.Columns[0].Visible = false;
		        grdAttribute.Columns[0].Visible = false;
                //grdArtifacts.Columns[0].Visible = false;
                //grdArtifacts.ShowFooter = false;
		        grdRelations.ShowFooter = false;
	        }
            else
            {
		        grdName.Columns[0].Visible = true;
		        grdDescription.Columns[0].Visible = true;
		        grdAttribute.Columns[0].Visible = true;
                //grdArtifacts.Columns[0].Visible = true;
                //grdArtifacts.ShowFooter = true;
		        grdRelations.ShowFooter = true;
	        }
        }


        public void ControlDeleteCommand(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;

	        if (E.CommandName == "Delete")
            {
                switch (dataGrid.ID)
                {
			        case "grdArtifacts":

				        SqlConnection sqlConn = SMARTSConnectionOpen();
				        //--- PROPAGATE ARTIFACT DELETION TO THE OBJECTS OF THIS SYSTEM TOO
                        string strSQL = String.Format("GetItem_Contained {0},{1},{2}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_SYSTEMOBJECT);
				        SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
				        DataTable sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
				        strSQL = "EXEC DeleteItem_Artifact " + Convert.ToInt32(((Label)E.Item.FindControl("lblArtifactID")).Text) + "," + Common.TABLE_SHAPE + "," + Convert.ToInt32(ddlList.SelectedItem.Value) + "," +  Common.LOGFUNCTION_DELETE_CONTAINER + "," + RewriteString(User.Identity.Name) + "; ";
                        //DataRow sqlRow = default(DataRow);

                        foreach (DataRow sqlRow in sqlTable.Rows)
                        {
					        strSQL = strSQL + "EXEC DeleteItem_Artifact " + Convert.ToInt32(((Label)E.Item.FindControl("lblArtifactID")).Text) + "," + Convert.ToInt32(sqlRow["Related_TableID"].ToString()) + "," + Convert.ToInt32(sqlRow["Related_ID"].ToString()) + "," +  Common.LOGFUNCTION_DELETE_CONTAINER + "," + RewriteString(User.Identity.Name) + "; ";
				        }

				        sqlCmd = new SqlCommand(strSQL, sqlConn);
				        sqlCmd.ExecuteNonQuery();

				        DataBindControl(Source, sqlConn);

				        sqlConn.Close();

				        break;
		        }
	        }
        }


        public void ControlItemCommand(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;
	        string strSQL = null;
	        int intValue = 0;
	        SqlCommand sqlCmd = default(SqlCommand);


	        if (E.CommandName == "Insert")
            {
		        SqlConnection sqlConn = SMARTSConnectionOpen();
		        switch (dataGrid.ID)
                {
                    //case "grdArtifacts":
                    //    intValue = int.Parse(((DropDownList)E.Item.FindControl("ddlArtifacts")).SelectedItem.Value);
                    //    if (intValue == Common.EMPTY_INT)
                    //    {
                    //        sqlConn.Close();
                    //        Response.Redirect("artifact.aspx?id=" + ddlList.SelectedItem.Value + "&type=" +  Common.SHAPETYPE_SYSTEM + "&artifact=" + Common.EMPTY_INT, false);
                    //        return;
                    //    }
                    //    else
                    //    {
                    //        //--- IF ARTIFACT IS NOT ALREADY ADDED, ADD IT
                    //        if (booSetArtifact(sqlConn, int.Parse(ddlList.SelectedItem.Value), intValue) == true) {
                    //            DataBindControl(Source, sqlConn);
                    //            //--- ADD ARTIFACT TO ALL ITS CONTAINED ITEMS TOO
                    //            strSQL = "GetItem_Contained " + Common.TABLE_SHAPE + "," + ddlList.SelectedItem.Value + "," + Common.ABSTRACTION_SYSTEMOBJECT;
                    //            sqlCmd = new SqlCommand(strSQL, sqlConn);
                    //            DataTable sqlTable = sqlCmd.ExecuteDataTable(sqlConn);

                    //            for (int i = 0; i <= sqlTable.Rows.Count - 1; i++)
                    //            {
                    //                booSetArtifact(sqlConn, int.Parse(sqlTable.Rows[i]["Related_ID"].ToString()), intValue);
                    //            }
                    //        }
                    //    }
                    //    break;

			        case "grdLifecycle":
				        subSetLifecycle(sqlConn, int.Parse(ddlList.SelectedItem.Value), E);
				        DataBindControl(Source, sqlConn);
				        break;
		        }
		        sqlConn.Close();

	        }


        }


        public void ControlEdit(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;

	        dataGrid.EditItemIndex = E.Item.ItemIndex;

	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        DataBindControl(dataGrid, sqlConn);
	        sqlConn.Close();

	        setFocus(dataGrid, E);

        }


        public void ControlCancel(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        lblMessage.Visible = false;
	        dataGrid.EditItemIndex = -1;
	        DataBindControl(Source, sqlConn);
	        sqlConn.Close();
        }



        public void ControlUpdate(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;
	        string strSQL = null;
	        string strValue = null;
            DropDownList ddlValues;

	        switch (dataGrid.ID) 
            {
		        case "grdLifecycle":
			        ddlValues = (DropDownList)E.Item.FindControl("ddlLifecycle");
			        int intValue = Convert.ToInt32(ddlValues.SelectedItem.Value);
                    strSQL = String.Format("SetItem_Lifecycle {0},{1},{2},{3},{4}", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.LOGFUNCTION_SET_LIFECYCLE, intValue, RewriteString(User.Identity.Name));
			        ToggleEditColumn(intValue);
			        break;

		        case "grdAttribute":
			        int intSTA_ID = int.Parse(((Label)E.Item.FindControl("lblSTA_ID")).Text);
			        ddlValues = (DropDownList)E.Item.FindControl("ddlAttributeValue");

			        if (ddlValues.Items.Count > 0) 
                    {
				        strValue = RewriteString(ddlValues.SelectedItem.Text);
			        }
                    else
                    {
				        strValue = RewriteString(((TextBox)E.Item.FindControl("txtAttributeValue")).Text);
			        }

			        strSQL = String.Format("SetAttributeValue {0},{1},{2},{3},{4},{5}", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value, intSTA_ID, strValue, 
                        Common.LOGFUNCTION_SET_ATTRIBUTEVALUE, RewriteString(User.Identity.Name));
			        break;

		        case "grdDescription":
			        strValue = ((TextBox)E.Item.FindControl("txtDescription")).Text;
			        strSQL = String.Format("SetItem_Desc {0},{1},{2},{3},{4}", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.LOGFUNCTION_SET_DESCRIPTION, RewriteString(strValue), RewriteString(User.Identity.Name));
			        break;

		        case "grdName":
			        lblMessage.Visible = true;
			        strValue = ((TextBox)E.Item.FindControl("txtName")).Text.Trim();

			        if (strValue.Length > Common.EMPTY_INT)
                    {
				        //--- NON BLANK NAME ENTRY
				        bool booExists = false;
				        for (int i = 0; i <= ddlList.Items.Count - 1; i++)
                        {
					        if (ddlList.SelectedIndex != i && strValue.ToUpper() == ddlList.Items[i].Text.ToUpper())
                            {
						        booExists = true;
					        }
				        }

				        if (booExists == true)
                        {
					        //--- NAME ALREADY EXISTS
					        lblMessage.Text = "Name already exists. Select another.";
					        return;
				        }
                        else
                        {
					        if (ddlList.SelectedIndex == Common.EMPTY_INT) 
                            {
						        lblMessage.Text = "Submitted.";
						        SubmitToDB(strValue);
						        return;
					        } 
                            else 
                            {
						        lblMessage.Text = "Revised.";
                                strSQL = String.Format("SetItem_Name {0},{1},{2},{3},{4}", 
                                    Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.LOGFUNCTION_SET_NAME, RewriteString(strValue), RewriteString(User.Identity.Name));
					        }
				        }
			        } 
                    else
                    {
				        lblMessage.Text = "Name cannot be blank. Please re-enter";
				        return;
			        }
			        break;
		        //lblMessage.Visible = True
		        //strValue = Trim(CType(E.Item.FindControl("txtName"), TextBox).Text)
		        //If Len(Trim(strValue)) > 0 Then
		        //    '--- NON BLANK NAME ENTRY
		        //    If Len(strValue) > Common.EMPTY_INT Then
		        //        '--- NON BLANK NAME ENTRY
		        //        Dim booExists As Boolean = False
		        //        For i As Integer = 0 To ddlList.Items.Count - 1
		        //            If ddlList.SelectedIndex <> i And strValue.ToUpper = ddlList.Items[i].Text.ToUpper Then
		        //                booExists = True
		        //            End If
		        //        Next
		        //        If booExists = True Then
		        //            '--- NAME ALREADY EXISTS
		        //            lblMessage.Text = "Name already exists. Select another."
		        //            Exit Sub
		        //        Else
		        //            If ddlList.SelectedIndex = Common.EMPTY_INT Then
		        //                lblMessage.Text = "Submitted."
		        //                SubmitToDB(strValue)
		        //                Exit Sub
		        //            Else
		        //                lblMessage.Text = "Revised."
		        //                strSQL = "SetItem_Name " & Common.TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_NAME & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
		        //            End If
		        //        End If
		        //    Else
		        //        lblMessage.Text = "Name cannot be blank. Please re-enter"
		        //        Exit Sub
		        //    End If
		        //End If
	        }

	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
	        sqlCmd.ExecuteNonQuery();

	        dataGrid.EditItemIndex = -1;
	        DataBindControl(dataGrid, sqlConn);

	        if (dataGrid.ID == "grdDescription" | dataGrid.ID == "grdName")
            {
		        DataBindControl(grdObjects, sqlConn);
		        DataBindControl(grdRelations, sqlConn);

		        if (dataGrid.ID == "grdName") 
                {
			        DataBindControl(ddlList, sqlConn);
			        ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByText(strValue));
		        }
	        }

	        sqlConn.Close();
        }

        public void SubmitToDB(string strName)
        {
            string newID;

            using (SqlConnection sqlConn = SMARTSConnectionOpen())
            {
                using (SqlCommand sqlCmd = new SqlCommand("SetItem", sqlConn))
                {
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@Table", Common.TABLE_SHAPE);
                    sqlCmd.Parameters.AddWithValue("@ShapeType", Common.SHAPETYPE_SYSTEM);
                    sqlCmd.Parameters.AddWithValue("@Lifecycle", Common.LIFECYCLE_CURRENT);
                    sqlCmd.Parameters.AddWithValue("@Function", Common.LOGFUNCTION_SET_SHAPE);
                    sqlCmd.Parameters.AddWithValue("@Value", strName.Trim().Replace("'", "''"));
                    sqlCmd.Parameters.AddWithValue("@Contact", User.Identity.Name.Trim().Replace("'", "''"));
                    sqlCmd.Parameters.AddWithValue("@NewID", 0).Direction = ParameterDirection.Output;
                    sqlCmd.ExecuteNonQuery();
                    newID = sqlCmd.Parameters["@NewID"].Value.ToString();
                }
            }

            Response.Redirect(String.Format("sys.aspx?id={0}&type={1}", newID, Common.SHAPETYPE_SYSTEM), false);
        }

        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
	        SetScroll();

	        if (Page.IsPostBack)
            {
		        SaveScroll();
	        }
            else
            {
		        //read results returned
		        SqlConnection sqlConn = SMARTSConnectionOpen();
		        DataBindControl(ddlList, sqlConn);

		        if (Request.QueryString["id"].Length > 0)
                {
			        ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString["id"]));
		        }
                else
                {
			        ddlList.SelectedIndex = 0;
		        }

		        DataBindPage(sqlConn);
		        sqlConn.Close();
	        }
        }

        protected void ddlList_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
            Response.Redirect(String.Format("sys.aspx?id={0}&type={1}", ddlList.SelectedItem.Value, Common.SHAPETYPE_SYSTEM), false);
        }

        private DataTable CreateDataTable()
        {
	        DataTable dtTable = new DataTable("Data");

	        dtTable.Columns.Add(new DataColumn("Shape_ID", typeof(int)));
	        dtTable.Columns.Add(new DataColumn("Shape_Name", typeof(string)));
	        dtTable.AcceptChanges();
	        DataRow dtRow = dtTable.NewRow();
	        dtRow["Shape_ID"] = Common.EMPTY_INT;
	        dtRow["Shape_Name"] = "";
	        dtTable.Rows.Add(dtRow);
	        dtTable.AcceptChanges();

	        return dtTable;
        }


        //--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS

        protected void DataBindPage(SqlConnection sqlConn)
        {
	        lblMessage.Visible = false;
	        DataBindControl(grdName, sqlConn);

	        if (ddlList.SelectedIndex == Common.EMPTY_INT) 
            {
		        grdDescription.Visible = false;
		        grdLifecycle.Visible = false;
		        grdAttribute.Visible = false;
                //grdArtifacts.Visible = false;
		        grdObjects.Visible = false;
		        grdRelations.Visible = false;
		        urlHistory.Visible = false;
		        urlBrowseThis.Visible = false;
	        } 
            else
            {
                urlHistory.NavigateUrl = String.Format("history.aspx?page=sys.aspx&id={0}&type={1}", Request.QueryString["id"], Request.QueryString["type"]);
                urlBrowseThis.NavigateUrl = String.Format("../Smarts3Browser/sys.aspx?id={0}&type={1}", Request.QueryString["id"], Request.QueryString["type"]);

		        if (grdName.Items.Count == Common.EMPTY_INT) 
                {
			        //GOT NOTHING BACK, GET LIST OF LATEST
			        DataBindControl(ddlList, sqlConn);
			        DataBindPage(sqlConn);
			        lblMessage.Text = "Selection is unavailable. Please select another.";
			        lblMessage.Visible = true;

		        } 
                else 
                {
			        DataBindControl(grdDescription, sqlConn);
			        DataBindControl(grdLifecycle, sqlConn);
			        grdLifecycle.Visible = true;
			        DataBindControl(grdAttribute, sqlConn);
			        grdAttribute.Visible = true;
                    //DataBindControl(grdArtifacts, sqlConn);
                    //grdArtifacts.Visible = true;
			        DataBindControl(grdObjects, sqlConn);
			        grdObjects.Visible = true;
			        DataBindControl(grdRelations, sqlConn);
			        grdRelations.Visible = true;

                    //Label lblLifecycle = (Label)grdLifecycle.Items.Item[0].FindControl("lblLifecycle_ID");
			        Label lblLifecycle = (Label)grdLifecycle.FindControl("lblLifecycle_ID");
			        ToggleEditColumn(Convert.ToInt32(lblLifecycle.Text));
		        }
	        }
        }

        public void ControlItemDataBound(object Source, DataGridItemEventArgs E)
        {
            DataGridItem dataGridItem = (DataGridItem)Source;

	        ListItemType typItem = E.Item.ItemType;
	        SqlCommand sqlCmd = default(SqlCommand);
	        DataTable sqlTable = new DataTable();
            SqlDataReader sqlReader;
	        string strSQL = null;
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        switch (typItem)
            {
		        case ListItemType.Footer:
			        switch (dataGridItem.ID)
                    {
                        //case "grdArtifacts":
                        //    DropDownList ddlData = (DropDownList)E.Item.FindControl("ddlArtifacts");
                        //    ddlData = GetArtifacts(ddlData, sqlConn);
                        //    break;
			        }

			        break;
		        case ListItemType.EditItem:
			        switch (dataGridItem.ID)
                    {
				        case "grdLifecycle":
					        DropDownList ddlValue = (DropDownList)E.Item.FindControl("ddlLifecycle");
					        Label lblValue = (Label)E.Item.FindControl("lblLifecycle_ID");
					        int intValue = Convert.ToInt32(lblValue.Text);
					        sqlCmd = new SqlCommand("GetLifecycleList", sqlConn);
					        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
					        ddlValue.DataSource = sqlTable;
					        ddlValue.DataBind();
					        ddlValue.Items.FindByValue(intValue.ToString()).Selected = true;
					        ddlValue.Visible = true;

					        if (grdRelations.Items.Count > 0 || grdObjects.Items.Count > 0)
                            {
						        ddlValue.Items.RemoveAt(ddlValue.Items.IndexOf(ddlValue.Items.FindByValue(Common.LIFECYCLE_RETIRE.ToString())));
					        }
					        ToggleEditColumn(intValue);
					        break;
				        case "grdAttribute":
					        PopulateControl_Attributes(E, sqlConn, ddlList);
					        break;
			        }
			        break;
	        }

	        sqlConn.Close();
        }
    }
}