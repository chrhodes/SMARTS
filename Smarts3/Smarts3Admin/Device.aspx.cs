using System;
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
    public partial class Device : PageBase
    {
        protected System.Web.UI.WebControls.DropDownList ddlContainedByDeviceShape;
        protected System.Web.UI.WebControls.DropDownList ddlContainedByDeviceShapeType;
        protected System.Web.UI.WebControls.DropDownList ddlContainDeviceShape;
        protected System.Web.UI.WebControls.DropDownList ddlContainDeviceShapeType;
        protected System.Web.UI.WebControls.DropDownList ddlDeviceObjectShape;
        protected System.Web.UI.WebControls.DropDownList ddlDeviceObjectSystem;
        protected System.Web.UI.WebControls.DropDownList ddlDeviceObjectShapeType;
        protected System.Web.UI.WebControls.DropDownList ddlRelationDevice;
        protected System.Web.UI.WebControls.DropDownList ddlRelationType;

        private DataTable CreateDataTable()
        {

	        DataTable dtTable = new DataTable("Data");
	        dtTable.Columns.Add(new DataColumn("Shape_ID", typeof(int)));
	        dtTable.Columns.Add(new DataColumn("Shape_Name", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("ShapeType_ID", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("ShapeType_Name", typeof(string)));
	        dtTable.AcceptChanges();
	        DataRow dtRow = dtTable.NewRow();
	        dtRow["Shape_ID"] = Common.EMPTY_INT;
	        dtRow["Shape_Name"] = "";
	        dtRow["ShapeType_ID"] = ddlTypeList.SelectedItem.Value;
	        dtRow["ShapeType_Name"] = ddlTypeList.SelectedItem.Text;
	        dtTable.Rows.Add(dtRow);
	        dtTable.AcceptChanges();

	        return dtTable;

        }

        protected void DataBindControl(object Source, SqlConnection sqlConn)
        {
            DropDownList ddlList = (DropDownList)Source;

	        SqlCommand sqlCmd = default(SqlCommand);
	        DataTable sqlTable = new DataTable();

            switch (ddlList.ID)
            {
		        case "ddlList":
			        sqlCmd = new SqlCommand("GetShapeList NULL," + ddlTypeList.SelectedItem.Value, sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
                    ddlList.DataSource = sqlTable;
                    ddlList.DataBind();
			        ddlList.Items.Insert(0, CreateListItem("CREATE NEW DEVICE"));
			        break;

		        case "grdAttribute":
                    sqlCmd = new SqlCommand(String.Format("GetItem_AttributeValue {0},{1},NULL", Common.TABLE_SHAPE, ddlList.SelectedItem.Value), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
                    ddlList.DataSource = sqlTable;
                    ddlList.DataBind();

                    for (int i = 0; i <= ddlList.Items.Count - 1; i++)
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

		        case "ddlDeviceObjectShape":
			        sqlCmd = new SqlCommand("GetItem_Contained " + Common.TABLE_SHAPE + "," + ddlDeviceObjectSystem.SelectedItem.Value + "," + Common.ABSTRACTION_SYSTEMOBJECT, sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);

                    foreach (DataRow drTemp in sqlTable.Rows)
                    {
				        if (drTemp["Principal_TypeID"].ToString() != ddlDeviceObjectShapeType.SelectedItem.Value.ToString())
                        {
					        drTemp.Delete();
				        }
			        }

			        ddlList.DataSource = sqlTable;
			        ddlList.DataBind();
			        break;

		        case "grdName":
			        if (int.Parse(ddlList.SelectedItem.Value) == Common.EMPTY_INT)
                    {
				        sqlTable = CreateDataTable();
			        
                    } else
                    {
				        sqlCmd = new SqlCommand("GetItem " + Common.TABLE_SHAPE + "," + ddlList.SelectedItem.Value, sqlConn);
				        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        }

                    ddlList.DataSource = sqlTable;
                    ddlList.DataBind();
			        break;

		        default:
			        switch (ddlList.ID)
                    {
				        case "ddlTypeList":
				        case "ddlContainDeviceShapeType":
				        case "ddlContainedByDeviceShapeType":
				        case "ddlRelationType":
					        sqlCmd = new SqlCommand("GetShapeTypeList " + Common.ABSTRACTION_DEVICE, sqlConn);
					        break;

				        case "grdDescription":
				        case "grdLifecycle":
				        case "grdShapeType":
					        sqlCmd = new SqlCommand("GetItem " + Common.TABLE_SHAPE + "," + ddlList.SelectedItem.Value, sqlConn);
					        break;

				        case "ddlDeviceObjectShapeType":
					        sqlCmd = new SqlCommand("GetShapeTypeList " +  Common.ABSTRACTION_OBJECT, sqlConn);
					        break;

				        case "ddlRelationDevice":
                            sqlCmd = new SqlCommand(String.Format("GetShapeList {0},{1}", Common.ABSTRACTION_DEVICE, ddlRelationType.SelectedItem.Value), sqlConn);
					        break;

				        case "ddlIP":
					        sqlCmd = new SqlCommand("GetShapeList NULL," +  Common.SHAPETYPE_IP, sqlConn);
					        break;

				        case "ddlContainDeviceShape":
                            sqlCmd = new SqlCommand(String.Format("GetShapeList {0},{1}", Common.ABSTRACTION_DEVICE, ddlContainDeviceShapeType.SelectedItem.Value), sqlConn);
					        break;

				        case "ddlContainedByDeviceShape":
                            sqlCmd = new SqlCommand(String.Format("GetShapeList {0},{1}", Common.ABSTRACTION_DEVICE, ddlContainedByDeviceShapeType.SelectedItem.Value), sqlConn);
					        break;

				        case "ddlDeviceObjectSystem":
					        sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_SYSTEM + "," +  Common.SHAPETYPE_SYSTEM, sqlConn);
					        break;

				        case "grdAddress":
                            sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_IP), sqlConn);
					        break;

				        case "grdArtifacts":
                            sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_ARTIFACT), sqlConn);
					        break;

				        case "grdContainDevice":
                            sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_DEVICE), sqlConn);
					        break;

				        case "grdContainedByDevice":
                            sqlCmd = new SqlCommand(String.Format("GetItem_Container {0},{1},{2}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_DEVICE), sqlConn);
					        break;

				        case "grdDeviceObject":
                            sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_DEVICEOBJECT), sqlConn);
					        break;

				        case "grdRelations":
                            sqlCmd = new SqlCommand(String.Format("GetItem_Relation NULL,{0},{1},{2}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_DEVICE), sqlConn);
					        break;
			        }

			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
                    ddlList.DataSource = sqlTable;
                    ddlList.DataBind();
			        break;
	        }

            ddlList.SelectedIndex = ddlList.Items.Count - 1;
        }


        public void ControlDeleteCommand(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;

	        if (E.CommandName == "Delete")
            {
		        SqlConnection sqlConn = SMARTSConnectionOpen();
		        string strSQL = null;

		        switch (dataGrid.ID)
                {
			        case "grdAddress":
                        strSQL = String.Format("DeleteContainer {0},{1},{2},{3}", 
                            Common.TABLE_CONTAINER, Convert.ToInt32(((Label)E.Item.FindControl("lblAddressID")).Text), Common.LOGFUNCTION_DELETE_CONTAINER, RewriteString(User.Identity.Name));
				        break;

			        case "grdArtifacts":
                        strSQL = String.Format("DeleteItem_Artifact {0},{1},{2},{3},{4}", 
                            Convert.ToInt32(((Label)E.Item.FindControl("lblArtifactID")).Text), Common.TABLE_SHAPE, Convert.ToInt32(ddlList.SelectedItem.Value), Common.LOGFUNCTION_DELETE_CONTAINER, RewriteString(User.Identity.Name));
				        break;

			        case "grdDeviceObject":
                        strSQL = String.Format("DeleteContainer {0},{1},{2},{3}", 
                            Common.TABLE_CONTAINER, Convert.ToInt32(((Label)E.Item.FindControl("lblDeviceObjectID")).Text), Common.LOGFUNCTION_DELETE_CONTAINER, RewriteString(User.Identity.Name));
				        break;

			        case "grdContainDevice":
                        strSQL = String.Format("DeleteContainer {0},{1},{2},{3}", 
                            Common.TABLE_CONTAINER, Convert.ToInt32(((Label)E.Item.FindControl("lblContainDeviceID")).Text), Common.LOGFUNCTION_DELETE_CONTAINER, RewriteString(User.Identity.Name));
				        break;

			        case "grdRelations":
                        strSQL = String.Format("DeleteRelation {0},{1},{2},{3},{4}", 
                            Common.TABLE_RELATION, Convert.ToInt32(((Label)E.Item.FindControl("lblRelationID")).Text), Common.ABSTRACTION_DEVICE, Common.LOGFUNCTION_DELETE_RELATION, RewriteString(User.Identity.Name));
				        break;
		        }

		        SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
		        sqlCmd.ExecuteNonQuery();

		        DataBindControl(dataGrid, sqlConn);

                if (dataGrid.ID == "grdAddress")
                {
			        DataBindControl(ddlIP, sqlConn);
		        }

		        sqlConn.Close();

	        }

        }


        public void ControlItemCommand(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;

	        if (E.CommandName == "Insert")
            {
		        SqlConnection sqlConn = SMARTSConnectionOpen();
		        string strSQL = null;
		        int intValue = 0;
		        string strValue = null;
		        SqlCommand sqlCmd = default(SqlCommand);

		        switch (dataGrid.ID)
                {
			        case "grdAddress":
				        strValue = ((TextBox)E.Item.FindControl("txtIPName")).Text;
				        ListItem itmIP = ddlIP.Items.FindByText(strValue);

				        if (itmIP == null)
                        {
					        //insert new IP into DB first
					        sqlCmd = new SqlCommand("SetItem", sqlConn);
		                    sqlCmd.CommandType = CommandType.StoredProcedure;
		                    sqlCmd.Parameters.AddWithValue("@Table", Common.TABLE_SHAPE);
		                    sqlCmd.Parameters.AddWithValue("@ShapeType", ddlTypeList.SelectedItem.Value);
		                    sqlCmd.Parameters.AddWithValue("@Lifecycle", Common.LIFECYCLE_CURRENT);
		                    sqlCmd.Parameters.AddWithValue("@Function", Common.LOGFUNCTION_SET_SHAPE);
		                    sqlCmd.Parameters.AddWithValue("@Value", strValue.Trim().Replace("'", "''"));
		                    sqlCmd.Parameters.AddWithValue("@Contact", User.Identity.Name.Trim().Replace("'", "''"));
		                    sqlCmd.Parameters.AddWithValue("@NewID", 0).Direction = ParameterDirection.Output;
		                    sqlCmd.ExecuteNonQuery();
					        int intID = int.Parse(sqlCmd.Parameters["@NewID"].Value.ToString());
					        sqlCmd = null;
					        //set new IP to Server
					        strSQL = String.Format("SetContainer {0},{1},{0},{2},{3},{4},{5}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, intID, Common.ABSTRACTION_IP, Common. LOGFUNCTION_SET_CONTAINER, RewriteString(User.Identity.Name));
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlCmd.ExecuteNonQuery();
					        DataBindControl(Source, sqlConn);
					        DataBindControl(ddlIP, sqlConn);
				        }
                        else
                        {
					        lblMessage.Text = "IP Address already exists. Please enter another.";
					        lblMessage.Visible = true;
				        }
				        break;

                    //case "grdArtifacts":
                    //    intValue = int.Parse(((DropDownList)E.Item.FindControl("ddlArtifacts")).SelectedItem.Value);

                    //    if (intValue == Common.EMPTY_INT)
                    //    {
                    //        sqlConn.Close();
                    //        Response.Redirect(String.Format("artifact.aspx?id={0}&type={1}&artifact={2}", ddlList.SelectedItem.Value, ddlTypeList.SelectedItem.Value, Common.EMPTY_INT), false);
                    //        return;
                    //    } 
                    //    else
                    //    {
                    //        //--- IF ARTIFACT IS NOT ALREADY ADDED, ADD IT
                    //        if (booSetArtifact(sqlConn, int.Parse(ddlList.SelectedItem.Value), intValue) == true)
                    //        {
                    //            DataBindControl(Source, sqlConn);
                    //        }
                    //    }
                    //    break;

			        case "grdLifecycle":
				        subSetLifecycle(sqlConn, int.Parse(ddlList.SelectedItem.Value), E);
				        DataBindControl(Source, sqlConn);
				        break;

			        case "grdDeviceObject":
				        if (((DropDownList)E.Item.FindControl("ddlDeviceObjectShape")).Items.Count != Common.EMPTY_INT)
                        {
					        int intShape = int.Parse(((DropDownList)E.Item.FindControl("ddlDeviceObjectShape")).SelectedItem.Value);
					        strSQL = String.Format("SetContainer {0},{1},{0},{2},{3},{4},{5}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, intShape, Common.ABSTRACTION_DEVICEOBJECT, Common. LOGFUNCTION_SET_CONTAINER, RewriteString(User.Identity.Name));
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlCmd.ExecuteNonQuery();
					        DataBindControl(Source, sqlConn);
				        }
				        break;

			        case "grdContainDevice":
				        if (((DropDownList)E.Item.FindControl("ddlContainDeviceShape")).Items.Count != Common.EMPTY_INT)
                        {
					        int intShape = int.Parse(((DropDownList)E.Item.FindControl("ddlContainDeviceShape")).SelectedItem.Value);
					        strSQL = String.Format("SetContainer {0},{1},{0},{2},{3},{4},{5}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, intShape, Common.ABSTRACTION_DEVICE, Common. LOGFUNCTION_SET_CONTAINER, RewriteString(User.Identity.Name));
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlCmd.ExecuteNonQuery();
					        DataBindControl(Source, sqlConn);
				        }
				        break;

			        case "grdContainedByDevice":
				        if (((DropDownList)E.Item.FindControl("ddlContainedByDeviceShape")).Items.Count != Common.EMPTY_INT)
                        {
					        int intShape = int.Parse(((DropDownList)E.Item.FindControl("ddlContainedByDeviceShape")).SelectedItem.Value);
					        strSQL = String.Format("SetContainer {0},{1},{0},{2},{3},{4},'{5}'", 
                                Common.TABLE_SHAPE, intShape, ddlList.SelectedItem.Value, Common.ABSTRACTION_DEVICE, Common. LOGFUNCTION_SET_CONTAINER, User.Identity.Name.Replace("'", "''"));
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlCmd.ExecuteNonQuery();
					        DataBindControl(Source, sqlConn);
				        }
				        break;

			        case "grdRelations":
				        if (((DropDownList)E.Item.FindControl("ddlRelationDevice")).Items.Count != Common.EMPTY_INT)
                        {
					        intValue = int.Parse(((DropDownList)E.Item.FindControl("ddlRelationDevice")).SelectedItem.Value);
					        strValue = RewriteString(((TextBox)E.Item.FindControl("txtRelation_Name")).Text);
					        int intDirection = int.Parse(((DropDownList)E.Item.FindControl("ddlRelationDirection")).SelectedItem.Value);
					       
                            if (intDirection == Common.DIRECTION_TO)
                            {
						        strSQL = String.Format("SetRelation NULL,{0},{1},{2},{1},{3},{4},{5},{6}", 
                                    strValue, Common.TABLE_SHAPE, ddlList.SelectedItem.Value, intValue, Common.ABSTRACTION_DEVICE, Common.LOGFUNCTION_SET_RELATION, RewriteString(User.Identity.Name));
					        }
                            else
                            {
						        strSQL = String.Format("SetRelation NULL,{0},{1},{2},{1},{3},{4},{5},{6}", 
                                    strValue, Common.TABLE_SHAPE, intValue, ddlList.SelectedItem.Value, Common.ABSTRACTION_DEVICE, Common.LOGFUNCTION_SET_RELATION, RewriteString(User.Identity.Name));
					        }

					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlCmd.ExecuteNonQuery();
					        DataBindControl(dataGrid, sqlConn);
				        }
				        break;
		        }

		        sqlConn.Close();
	        }
        }

        public void ControlEdit(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;
	        dataGrid.EditItemIndex = E.Item.ItemIndex;

            using (SqlConnection sqlconn = SMARTSConnectionOpen())
            {
                DataBindControl(Source, sqlconn);
            }

	        setFocus(Source, E);
        }


        public void ControlCancel(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;

            using (SqlConnection sqlconn = SMARTSConnectionOpen())
            {
                lblMessage.Visible = false;
                dataGrid.EditItemIndex = -1;
                DataBindControl(Source, sqlconn);
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
		        grdAddress.Columns[0].Visible = false;
		        grdAddress.ShowFooter = false;
		        grdRelations.Columns[0].Visible = false;
		        grdRelations.ShowFooter = false;
		        grdDeviceObject.Columns[0].Visible = false;
		        grdDeviceObject.ShowFooter = false;
		        grdContainDevice.Columns[0].Visible = false;
		        grdContainDevice.ShowFooter = false;
	        }
            else
            {
		        grdName.Columns[0].Visible = true;
		        grdDescription.Columns[0].Visible = true;
		        grdAttribute.Columns[0].Visible = true;
                //grdArtifacts.Columns[0].Visible = true;
                //grdArtifacts.ShowFooter = true;
		        grdAddress.Columns[0].Visible = true;
		        grdAddress.ShowFooter = true;
		        grdRelations.Columns[0].Visible = true;
		        grdRelations.ShowFooter = true;
		        grdDeviceObject.Columns[0].Visible = true;
		        grdDeviceObject.ShowFooter = true;
		        grdContainDevice.Columns[0].Visible = true;
		        grdContainDevice.ShowFooter = true;
	        }

	        grdContainedByDevice.Columns[0].Visible = false;
	        grdContainedByDevice.ShowFooter = false;
        }

        private void SubmitToDB(string strValue)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        SqlCommand sqlCmd = new SqlCommand("SetItem", sqlConn);
	        {
		        sqlCmd.CommandType = CommandType.StoredProcedure;
		        sqlCmd.Parameters.AddWithValue("@Table", Common.TABLE_SHAPE);
		        sqlCmd.Parameters.AddWithValue("@ShapeType", ddlTypeList.SelectedItem.Value);
		        sqlCmd.Parameters.AddWithValue("@Lifecycle", Common.LIFECYCLE_CURRENT);
		        sqlCmd.Parameters.AddWithValue("@Function", Common.LOGFUNCTION_SET_SHAPE);
		        sqlCmd.Parameters.AddWithValue("@Value", strValue.Trim().Replace("'", "''"));
		        sqlCmd.Parameters.AddWithValue("@Contact", User.Identity.Name.Trim().Replace("'", "''"));
		        sqlCmd.Parameters.AddWithValue("@NewID", 0).Direction = ParameterDirection.Output;
		        sqlCmd.ExecuteNonQuery();
	        }
	        sqlConn.Close();

	        string strID = sqlCmd.Parameters["@NewID"].Value.ToString();
            Response.Redirect(String.Format("Device.aspx?type={0}&id={1}", ddlTypeList.SelectedItem.Value, strID), false);
        }

        public void ControlUpdate(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;

	        string strSQL = null;
	        string strValue = "";
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
				        strValue = RewriteString(Convert.ToString(ddlValues.SelectedItem.Text));
			        }
                    else
                    {
				        strValue = RewriteString(((TextBox)E.Item.FindControl("txtAttributeValue")).Text);
			        }
                    strSQL = String.Format("SetAttributeValue {0},{1},{2},{3},{4},{5}", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value, intSTA_ID, strValue, Common.LOGFUNCTION_SET_ATTRIBUTEVALUE, RewriteString(User.Identity.Name));
			        break;

		        case "grdDescription":
			        strValue = ((TextBox)E.Item.FindControl("txtDescription")).Text;
                    strSQL = String.Format("SetItem_Desc {0},{1},{2},{3},{4}", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.LOGFUNCTION_SET_DESCRIPTION, RewriteString(strValue), RewriteString(User.Identity.Name));
			        break;

		        case "grdName":
			        strValue = ((TextBox)E.Item.FindControl("txtName")).Text.Trim();
			        lblMessage.Visible = true;

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

		        //If Len(strValue) > Common.EMPTY_INT Then
		        //    '--- NON BLANK NAME ENTRY
		        //    Dim booExists As Boolean = False
		        //    For i As Integer = 0 To ddlList.Items.Count - 1
		        //        If ddlList.SelectedIndex <> i And strValue.ToUpper = ddlList.Items[i].Text.ToUpper Then
		        //            booExists = True
		        //        End If
		        //    Next
		        //    If booExists = True Then
		        //        '--- NAME ALREADY EXISTS
		        //        lblMessage.Text = "Name already exists. Select another."
		        //        Exit Sub
		        //    Else
		        //        If ddlList.SelectedIndex = Common.EMPTY_INT Then
		        //            lblMessage.Text = "Submitted."
		        //            SubmitToDB(strValue)
		        //            Exit Sub
		        //        Else
		        //            lblMessage.Text = "Revised."
		        //            strSQL = "SetItem_Name " & Common.TABLE_SHAPE & "," & ddlList.SelectedItem.Value & "," & LOGFUNCTION_SET_NAME & "," & RewriteString(strValue) & "," & RewriteString(User.Identity.Name)
		        //        End If
		        //    End If
		        //Else
		        //    lblMessage.Text = "Name cannot be blank. Please re-enter"
		        //    Exit Sub
		        //End If
	        }

	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
	        sqlCmd.ExecuteNonQuery();

	        dataGrid.EditItemIndex = -1;
	        DataBindControl(dataGrid, sqlConn);

	        if (dataGrid.ID == "grdDescription" | dataGrid.ID == "grdName") 
            {
		        DataBindControl(grdRelations, sqlConn);

		        if (dataGrid.ID == "grdName")
                {
			        DataBindControl(ddlList, sqlConn);
			        ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByText(strValue));
		        }
	        }

	        sqlConn.Close();
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
		        try
                {
			        SqlConnection sqlConn = SMARTSConnectionOpen();
			        try
                    {
				        DataBindControl(ddlIP, sqlConn);
				        DataBindControl(ddlTypeList, sqlConn);

				        if (Request.QueryString["id"].Length > 0)
                        {
					        ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString["type"]));
					        DataBindControl(ddlList, sqlConn);
					        ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString["id"]));
				        }
                        else
                        {
					        //--- DEFAULT SET DEVICE LIST TO SERVER
					        ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Common.SHAPETYPE_SERVER.ToString()));
					        DataBindControl(ddlList, sqlConn);
					        ddlList.SelectedIndex = 0;
				        }

				        DataBindPage(sqlConn);
			        }
                    catch (Exception ex)
                    {
				        Response.Write(ex.Message);
			        }
                    finally
                    {
				        sqlConn.Close();
			        }
		        }
                catch (Exception ex)
                {
			        Response.Write(ex.Message);
		        }
	        }
        }

        public void DataBindDependentList(object Sender, System.EventArgs E)
        {
	        //Get the Shape DropDown
	        SqlCommand sqlCmd = default(SqlCommand);
	        DataTable sqlTable = new DataTable();
	        DropDownList ddlShape = default(DropDownList);
	        DropDownList ddlType = (DropDownList)Sender;
	        int intType = int.Parse(ddlType.SelectedItem.Value);
	        DataGridItem item = (DataGridItem)ddlType.Parent.Parent;
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        switch (((DropDownList)Sender).ID)
            {
		        case "ddlDeviceObjectSystem":
		        case "ddlDeviceObjectShapeType":
			        ddlShape = (DropDownList)item.FindControl("ddlDeviceObjectShape");

			        if (intType == Common.EMPTY_INT)
                    {
				        ddlShape.Items.Clear();
			        }
                    else
                    {
                        //DataRow drTemp = default(DataRow);
				        DropDownList ddlSystem = (DropDownList)item.FindControl("ddlDeviceObjectSystem");
				        DropDownList ddlShapeType = (DropDownList)item.FindControl("ddlDeviceObjectShapeType");
                        sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", 
                            Common.TABLE_SHAPE, ddlSystem.SelectedItem.Value, Common.ABSTRACTION_SYSTEMOBJECT), sqlConn);
				        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);

				        foreach (DataRow  drTemp in sqlTable.Rows)
                        {
					        if (drTemp["Related_TypeID"] != ddlShapeType.SelectedItem.Value)
                            {
						        drTemp.Delete();
					        }
				        }

				        ddlShape.DataSource = sqlTable;
				        ddlShape.DataBind();
			        }
			        grdDeviceObject.SelectedIndex = grdDeviceObject.Items.Count;

			        break;

		        case "ddlContainDeviceShapeType":
			        ddlShape = (DropDownList)item.FindControl("ddlContainDeviceShape");

			        if (intType == Common.EMPTY_INT)
                    {
				        ddlShape.Items.Clear();
			        }
                    else
                    {
                        //DataRow dsRow = default(DataRow);
				        sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_DEVICE + "," + intType, sqlConn);
				        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
				        string strSQL = "";

				        if (sqlTable.Rows.Count > 0)
                        {
					        //SHAPES EXIST - FILTER OUT ANY SHAPES ON THE LIST THAT IS ALREADY CONTAINED BY ANOTHER 
                            foreach (DataRow dsRow in sqlTable.Rows)
                            {
						        //SHAPE CANNOT CONTAIN ITSELF
						        if (ddlList.SelectedItem.Value == dsRow["shape_id"])
                                {
							        dsRow.Delete();
						        }
                                else
                                {
							        strSQL = strSQL + "EXEC GetItem_Container " + Convert.ToString(Common.TABLE_SHAPE) + "," + dsRow["shape_id"] + "," + Common.ABSTRACTION_DEVICE + "; ";
						        }
					        }

					        sqlTable.AcceptChanges();
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
                            DataSet sqlSet = sqlCmd.ExecuteDataSet(sqlConn);

					        for (int i = 0; i <= sqlSet.Tables.Count - 1; i++) 
                            {
						        if (sqlSet.Tables[i].Rows.Count > 0) 
                                {
							        sqlTable.Rows[i].Delete();
						        }
					        }

					        sqlTable.AcceptChanges();
				        }

				        ddlShape.DataSource = sqlTable;
				        ddlShape.DataBind();
			        }
			        grdContainDevice.SelectedIndex = grdContainDevice.Items.Count;

			        break;
		        case "ddlContainedByDeviceShapeType":

			        ddlShape = (DropDownList)item.FindControl("ddlContainedByDeviceShape");
			        if (intType == Common.EMPTY_INT) {
				        ddlShape.Items.Clear();
			        } else {
				        sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_DEVICE + "," + intType, sqlConn);
				        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
				        ddlShape.DataSource = sqlTable;
				        ddlShape.DataBind();
			        }
			        //setFocus(Page.FindControl("grdContainedByDevice"))
			        grdContainedByDevice.SelectedIndex = grdContainedByDevice.Items.Count;

			        break;
		        case "ddlRelationType":

			        ddlShape = (DropDownList)item.FindControl("ddlRelationDevice");
			        if (intType == Common.EMPTY_INT) {
				        ddlShape.Items.Clear();
			        } else {
				        sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_DEVICE + "," + intType, sqlConn);
				        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
				        ddlShape.DataSource = sqlTable;
				        ddlShape.DataBind();
			        }
			        grdRelations.SelectedIndex = grdRelations.Items.Count;

			        break;
	        }

	        sqlConn.Close();


        }


        private void  // ERROR: Handles clauses are not supported in C#
        ddlTypeList_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
	        try {
		        SqlConnection sqlConn = SMARTSConnectionOpen();
		        try {
			        DataBindControl(ddlList, sqlConn);
			        ddlList.SelectedIndex = 0;
			        DataBindPage(sqlConn);
			        grdName.EditItemIndex = -1;
			        grdDescription.EditItemIndex = -1;
			        grdAttribute.EditItemIndex = -1;
		        } catch (Exception ex) {
			        Response.Write(ex.Message);
		        } finally {
			        sqlConn.Close();
		        }
	        } catch (Exception ex) {
		        Response.Write(ex.Message);
	        }

        }



        private void  // ERROR: Handles clauses are not supported in C#
        ddlList_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        if (ddlList.SelectedIndex == Common.EMPTY_INT) {
		        grdName.EditItemIndex = -1;
		        grdDescription.EditItemIndex = -1;
		        grdAttribute.EditItemIndex = -1;
		        DataBindPage(sqlConn);
		        sqlConn.Close();
	        } else {
		        sqlConn.Close();
		        Response.Redirect("Device.aspx?type=" + ddlTypeList.SelectedItem.Value + "&id=" + ddlList.SelectedItem.Value, false);
	        }

        }

        //--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS

        public void DataBindPage(SqlConnection sqlConn)
        {
	        lblMessage.Visible = false;
	        DataBindControl(grdName, sqlConn);

	        if (int.Parse(ddlList.SelectedItem.Value) == Common.EMPTY_INT) 
            {
		        grdDescription.Visible = false;
		        grdLifecycle.Visible = false;
		        grdAttribute.Visible = false;
                //grdArtifacts.Visible = false;
		        grdRelations.Visible = false;
		        grdContainedByDevice.Visible = false;
		        grdContainDevice.Visible = false;
		        grdDeviceObject.Visible = false;
		        grdAddress.Visible = false;
		        urlHistory.Visible = false;
		        urlBrowseThis.Visible = false;
	        }
            else
            {
                urlHistory.NavigateUrl = String.Format("history.aspx?page=device.aspx&id={0}&type={1}", Request.QueryString["id"], Request.QueryString["type"]);
                urlBrowseThis.NavigateUrl = String.Format("../Smarts3Browser/device.aspx?id={0}&type={1}", Request.QueryString["id"], Request.QueryString["type"]);

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
			        grdDescription.Visible = true;
			        DataBindControl(grdLifecycle, sqlConn);
			        grdLifecycle.Visible = true;
			        DataBindControl(grdAddress, sqlConn);
			        grdAddress.Visible = true;
			        DataBindControl(grdAttribute, sqlConn);
			        grdAttribute.Visible = true;
                    //DataBindControl(grdArtifacts, sqlConn);
                    //grdArtifacts.Visible = true;
			        DataBindControl(grdRelations, sqlConn);
			        grdRelations.Visible = true;
			        DataBindControl(grdContainDevice, sqlConn);
			        grdContainDevice.Visible = true;
			        DataBindControl(grdDeviceObject, sqlConn);
			        grdDeviceObject.Visible = true;
			        DataBindControl(grdContainedByDevice, sqlConn);
			        grdContainedByDevice.Visible = true;

			        //--- TOGGLE THE EDIT COLUMNS DEPENDING ON LIFECYCLE STATE
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
	        DataTable sqlTable = new DataTable();
	        SqlCommand sqlCmd = default(SqlCommand);
	        SqlDataReader sqlReader;
	        string strSQL = null;
            DropDownList ddlData;

	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        switch (typItem)
            {
		        case ListItemType.Footer:
			        switch (dataGridItem.ID)
                    {
                        //case "grdArtifacts":
                        //    ddlData = (DropDownList)E.Item.FindControl("ddlArtifacts");
                        //    ddlData = GetArtifacts(ddlData, sqlConn);
                        //    break;

				        case "grdDeviceObject":
					        ddlData = (DropDownList)E.Item.FindControl("ddlDeviceObjectSystem");
					        strSQL = "EXEC GetShapeList " + Common.ABSTRACTION_SYSTEM + "," +  Common.SHAPETYPE_SYSTEM;
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
					        ddlData.DataSource = sqlTable;
					        ddlData.DataBind();
					        DropDownList ddlData2 = (DropDownList)E.Item.FindControl("ddlDeviceObjectShapeType");
					        strSQL = "EXEC GetShapeTypeList " +  Common.ABSTRACTION_OBJECT;
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
					        ddlData2.DataSource = sqlTable;
					        ddlData2.DataBind();
					        ddlData.Items.Insert(0, CreateListItem("SELECT"));
					        ddlData2.Items.Insert(0, CreateListItem("SELECT"));
					        break;

				        case "grdContainDevice":
					        ddlData = (DropDownList)E.Item.FindControl("ddlContainDeviceShapeType");
					        sqlCmd = new SqlCommand("GetShapeTypeList " + Common.ABSTRACTION_DEVICE, sqlConn);
					        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);

					        if (sqlTable.Rows.Count > 0)
                            {
						        ddlData.DataSource = sqlTable;
						        ddlData.DataBind();
					        }

					        ddlData.Items.Insert(0, CreateListItem("SELECT"));
					        break;

				        case "grdContainedByDevice":
					        ddlData = (DropDownList)E.Item.FindControl("ddlContainedByDeviceShapeType");
					        sqlCmd = new SqlCommand("GetShapeTypeList " + Common.ABSTRACTION_DEVICE, sqlConn);

					        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
					        if (sqlTable.Rows.Count > 0)
                            {
						        ddlData.DataSource = sqlTable;
						        ddlData.DataBind();
					        }

					        ddlData.Items.Insert(0, CreateListItem("SELECT"));
					        break;

				        case "grdRelations":
					        ddlData = (DropDownList)E.Item.FindControl("ddlRelationType");
					        sqlCmd = new SqlCommand("GetShapeTypeList " + Common.ABSTRACTION_DEVICE, sqlConn);
					        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);

					        if (sqlTable.Rows.Count > 0)
                            {
						        ddlData.DataSource = sqlTable;
						        ddlData.DataBind();
					        }

					        ddlData.Items.Insert(0, CreateListItem("SELECT"));
					        break;
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

					        if ((grdRelations.Items.Count > 0))
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