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
    public partial class Step : PageBase
    {
        protected System.Web.UI.WebControls.DropDownList ddlStepObjectSystem;
        protected System.Web.UI.WebControls.DropDownList ddlStepObjectShape;
        protected System.Web.UI.WebControls.DropDownList ddlStepObjectShapeType;
        protected System.Web.UI.WebControls.DropDownList ddlRelated;
        protected System.Web.UI.WebControls.DropDownList ddlRelatedBusiness;

        private DataTable CreateDataTable()
        {

	        DataTable dtTable = new DataTable("Data");
	        dtTable.Columns.Add(new DataColumn("Principal_ID", typeof(int)));
	        dtTable.Columns.Add(new DataColumn("Principal_Name", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("Principal_TypeName", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("PrincipalContainer_ID", typeof(string)));
	        dtTable.Columns.Add(new DataColumn("PrincipalContainer_Name", typeof(string)));
	        dtTable.AcceptChanges();
	        DataRow dtRow = dtTable.NewRow();
	        dtRow["Principal_ID"] = Common.EMPTY_INT;
	        dtRow["Principal_Name"] = "";
	        dtRow["Principal_TypeName"] = ddlTypeList.SelectedItem.Text;
	        dtRow["PrincipalContainer_ID"] = ddlBusinessList.SelectedItem.Value;
	        dtRow["PrincipalContainer_Name"] = ddlBusinessList.SelectedItem.Text;
	        dtTable.Rows.Add(dtRow);
	        dtTable.AcceptChanges();

	        return dtTable;

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
		        grdStepObject.Columns[0].Visible = false;
		        grdStepObject.ShowFooter = false;
		        grdRelations.Columns[0].Visible = false;
		        grdRelations.ShowFooter = false;
	        } 
            else
            {
		        grdName.Columns[0].Visible = true;
		        grdDescription.Columns[0].Visible = true;
		        grdAttribute.Columns[0].Visible = true;
                //grdArtifacts.Columns[0].Visible = true;
                //grdArtifacts.ShowFooter = true;
		        grdStepObject.Columns[0].Visible = true;
		        grdStepObject.ShowFooter = true;
		        grdRelations.Columns[0].Visible = true;
		        grdRelations.ShowFooter = true;
	        }
        }


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
                        sqlCmd = new SqlCommand(String.Format("GetItem_Container {0},{1},{2};", 
                            Common.TABLE_SHAPE, Convert.ToInt32(ddlList.SelectedItem.Value), Common.ABSTRACTION_BUSINESSSTEP), sqlConn);
				        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        }
			        break;

		        case "ddlBusinessList":
		        case "ddlRelatedBusiness":
			        sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_BUSINESS + ",NULL", sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "ddlTypeList":
			        sqlCmd = new SqlCommand("GetShapeTypeList " + Common.ABSTRACTION_STEP, sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "ddlList":
                    sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", 
                        Common.TABLE_SHAPE, ddlBusinessList.SelectedItem.Value, Common.ABSTRACTION_BUSINESSSTEP), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);

			        foreach (DataRow  drTemp in sqlTable.Rows)
                    {
				        if (drTemp["Related_TypeID"].ToString() != ddlTypeList.SelectedItem.Value)
                        {
					        drTemp.Delete();
				        }
			        }

			        break;

		        case "ddlStepObjectShapeType":
			        sqlCmd = new SqlCommand("GetShapeTypeList " +  Common.ABSTRACTION_OBJECT, sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "ddlStepObjectSystem":
			        sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_SYSTEM + "," +  Common.SHAPETYPE_SYSTEM, sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "ddlStepObjectShape":
			        sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", 
                        Common.TABLE_SHAPE, ddlStepObjectSystem.SelectedItem.Value, Common.ABSTRACTION_SYSTEMOBJECT), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);

                    foreach (DataRow drTemp in sqlTable.Rows)
                    {
                        if (drTemp["Related_TypeID"].ToString() != ddlStepObjectShapeType.SelectedItem.Value.ToString())
                        {
					        drTemp.Delete();
				        }
			        }

			        break;

		        case "ddlRelated":
                    sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", 
                        Common.TABLE_SHAPE, ddlRelatedBusiness.SelectedItem.Value, Common.ABSTRACTION_BUSINESSSTEP), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdDescription":
		        case "grdLifecycle":
                    sqlCmd = new SqlCommand(String.Format("GetItem {0},{1}", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdAttribute":
                    sqlCmd = new SqlCommand(String.Format("GetItem_AttributeValue {0},{1},NULL", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdStepObject":
                    sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_STEPOBJECT), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

                //case "grdArtifacts":
                //    sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", 
                //        Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_ARTIFACT), sqlConn);
                //    sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
                //    break;

		        case "grdRelations":
                    sqlCmd = new SqlCommand(String.Format("GetItem_Relation NULL,{0},{1},{2}", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_STEP), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;
	        }

            ddlList.DataSource = sqlTable;
            ddlList.DataBind();

            switch (ddlList.ID)
            {
		        case "ddlList":
			        ddlList.Items.Insert(0, CreateListItem("CREATE NEW PROCESS STEP"));
			        break;
		        case "grdAttribute":
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
	        }

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
			        case "grdStepObject":
                        strSQL = String.Format("DeleteContainer {0},{1},{2},{3}", 
                            Common.TABLE_CONTAINER, Convert.ToInt32(((Label)E.Item.FindControl("lblStepObjectID")).Text), Common.LOGFUNCTION_DELETE_CONTAINER, RewriteString(User.Identity.Name));
				        break;

                    //case "grdArtifacts":
                    //    strSQL = String.Format("DeleteItem_Artifact {0},{1},{2},{3},{4}", 
                    //        Convert.ToInt32(((Label)E.Item.FindControl("lblArtifactID")).Text), Common.TABLE_SHAPE, Convert.ToInt32(ddlList.SelectedItem.Value), Common.LOGFUNCTION_DELETE_CONTAINER, RewriteString(User.Identity.Name));
                    //    break;

			        case "grdRelations":
                        strSQL = String.Format("DeleteRelation {0},{1},{2},{3},{4}", 
                            Common.TABLE_RELATION, Convert.ToInt32(((Label)E.Item.FindControl("lblRelationID")).Text), Common.ABSTRACTION_STEP, Common.LOGFUNCTION_DELETE_RELATION, RewriteString(User.Identity.Name));
				        break;
		        }

		        SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
		        sqlCmd.ExecuteNonQuery();
		        DataBindControl(Source, sqlConn);

		        sqlConn.Close();
	        }
        }


        public void ControlItemCommand(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;

	        if (E.CommandName == "Insert")
            {
		        int intValue = 0;
		        int intDirection = 0;
		        string strSQL = null;
		        string strValue = null;
		        SqlCommand sqlCmd = default(SqlCommand);
		        SqlConnection sqlConn = SMARTSConnectionOpen();

		        switch (dataGrid.ID)
                {
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

			        case "grdRelations":
				        if (((DropDownList)E.Item.FindControl("ddlRelated")).Items.Count != Common.EMPTY_INT)
                        {
					        intValue = int.Parse(((DropDownList)E.Item.FindControl("ddlRelated")).SelectedItem.Value);
					        strValue = RewriteString(((TextBox)E.Item.FindControl("txtRelation_Name")).Text);
					        intDirection = int.Parse(((DropDownList)E.Item.FindControl("ddlDirection")).SelectedItem.Value);

					        if (intDirection == Common.DIRECTION_TO)
                            {
                                strSQL = String.Format("SetRelation NULL,{0},{1},{2},{1},{3},{4},{5},{6}",
                                    strValue, Common.TABLE_SHAPE, ddlList.SelectedItem.Value, intValue, Common.ABSTRACTION_STEP, Common.LOGFUNCTION_SET_RELATION, RewriteString(User.Identity.Name));
					        }
                            else 
                            {
                                strSQL = String.Format("SetRelation NULL,{0},{1},{2},{1},{3},{4},{5},{6}",
                                    strValue, Common.TABLE_SHAPE, intValue, ddlList.SelectedItem.Value, Common.ABSTRACTION_STEP, Common.LOGFUNCTION_SET_RELATION, RewriteString(User.Identity.Name));
					        }
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlCmd.ExecuteNonQuery();
					        DataBindControl(Source, sqlConn);
				        }
				        break;

			        case "grdStepObject":
				        if (((DropDownList)E.Item.FindControl("ddlStepObjectShape")).Items.Count != Common.EMPTY_INT)
                        {
					        intValue = int.Parse(((DropDownList)E.Item.FindControl("ddlStepObjectShape")).SelectedItem.Value);
                            strSQL = String.Format("SetContainer {0},{1},{0},{2},{3},{4},{5}", 
                                Common.TABLE_SHAPE, ddlList.SelectedItem.Value, intValue, Common.ABSTRACTION_STEPOBJECT, Common.LOGFUNCTION_SET_CONTAINER, RewriteString(User.Identity.Name));
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlCmd.ExecuteNonQuery();
					        DataBindControl(Source, sqlConn);
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
	        DataBindControl(dataGrid, sqlConn);

	        sqlConn.Close();

        }

        public void SubmitToDB(string strValue)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        SqlCommand sqlCmd = default(SqlCommand);

	        //--- SET SHAPE INTO DB
	        sqlCmd = new SqlCommand("SetItem", sqlConn);
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

	        string strObject = sqlCmd.Parameters["@NewID"].Value.ToString();
            string strSQL = String.Format("SetContainer {0},{1},{0},{2},{3},{4},{5}", 
                Common.TABLE_SHAPE, ddlBusinessList.SelectedItem.Value, Convert.ToInt32(strObject), Common.ABSTRACTION_BUSINESSSTEP, Common.LOGFUNCTION_SET_SHAPE, RewriteString(User.Identity.Name));

	        //--- SET CONTAINER THE SHAPE BELONGS IN
	        sqlCmd = null;
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
	        sqlCmd.ExecuteNonQuery();

	        sqlConn.Close();

            Response.Redirect(String.Format("step.aspx?type={0}&id={1}", ddlTypeList.SelectedItem.Value, strObject), false);

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
			        strValue = RewriteString(((TextBox)E.Item.FindControl("txtDescription")).Text);
                    strSQL = String.Format("SetItem_Desc {0},{1},{2},{3},{4}", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.LOGFUNCTION_SET_DESCRIPTION, strValue, RewriteString(User.Identity.Name));
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
	        }

            using (SqlConnection sqlConn = SMARTSConnectionOpen())
            {
                using (SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn))
                {
                    sqlCmd.ExecuteNonQuery();
                }

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

		        DataBindControl(ddlTypeList, sqlConn);
		        DataBindControl(ddlBusinessList, sqlConn);

		        if (Request.QueryString["id"].Length > 0)
                {
			        ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString["type"]));
                    SqlCommand sqlCmd = new SqlCommand(String.Format("GetItem_Container {0},{1},{2}", 
                        Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_BUSINESSSTEP), sqlConn);
			        DataTable sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        int intID = int.Parse(sqlTable.Rows[0].Field<string>("Related_ID"));
			        ddlBusinessList.SelectedIndex = ddlBusinessList.Items.IndexOf(ddlBusinessList.Items.FindByValue(intID.ToString()));
			        DataBindControl(ddlList, sqlConn);
			        ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString["id"]));
		        }
                else
                {
			        ddlTypeList.SelectedIndex = 0;
			        ddlBusinessList.SelectedIndex = 0;
			        DataBindControl(ddlList, sqlConn);
			        ddlList.SelectedIndex = 0;
		        }

		        DataBindPage(sqlConn);
		        sqlConn.Close();


		        //Dim sqlConn As SqlConnection = SMARTSConnectionOpen()
		        //Dim sqlCmd As SqlCommand
		        //Dim sqlTable As New DataTable
		        //Dim strSQL As String

		        //'read results returned
		        //DataBindControl(ddlTypeList, sqlConn)
		        //If Len(CStr(Request.QueryString["id"])) > 0 Then
		        //    ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString["type"]))
		        //    sqlCmd = New SqlCommand("GetItem_Container " & Common.TABLE_SHAPE & "," & Request.QueryString["id"] & "," & Common.ABSTRACTION_BUSINESSSTEP, sqlConn)
		        //    sqlTable = sqlCmd.ExecuteDataTable
		        //    ddlBusinessList.DataValueField = "Related_ID"
		        //    ddlBusinessList.DataTextField = "Related_Name"
		        //    ddlBusinessList.DataSource = sqlTable
		        //    ddlBusinessList.DataBind()
		        //    DataBindControl(ddlList, sqlConn)
		        //    ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString["id"]))
		        //Else
		        //    ddlTypeList.SelectedIndex = 0
		        //    sqlCmd = New SqlCommand("GetShapeList " & Common.ABSTRACTION_BUSINESS & ",NULL", sqlConn)
		        //    sqlTable = sqlCmd.ExecuteDataTable
		        //    ddlBusinessList.DataValueField = "Shape_ID"
		        //    ddlBusinessList.DataTextField = "Shape_Name"
		        //    ddlBusinessList.DataSource = sqlTable
		        //    ddlBusinessList.DataBind()
		        //    ddlBusinessList.SelectedIndex = 0
		        //    DataBindControl(ddlList, sqlConn)
		        //    ddlList.SelectedIndex = 0
		        //End If
		        //DataBindPage(sqlConn)

		        //sqlConn.Close()

	        }

        }


        private void  // ERROR: Handles clauses are not supported in C#
        ddlBusinessList_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        DataBindControl(ddlList, sqlConn);
	        DataBindPage(sqlConn);
	        grdName.EditItemIndex = -1;
	        grdDescription.EditItemIndex = -1;
	        grdAttribute.EditItemIndex = -1;

	        sqlConn.Close();

        }



        private void  // ERROR: Handles clauses are not supported in C#
        ddlTypeList_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        DataBindControl(ddlList, sqlConn);

	        ddlList.SelectedIndex = 0;
	        DataBindPage(sqlConn);
	        grdName.EditItemIndex = -1;
	        grdDescription.EditItemIndex = -1;
	        grdAttribute.EditItemIndex = -1;

	        sqlConn.Close();

        }


        private void  // ERROR: Handles clauses are not supported in C#
        ddlList_SelectedIndexChanged(System.Object sender, System.EventArgs e)
        {
	        if (ddlList.SelectedIndex == Common.EMPTY_INT)
            {
		        SqlConnection sqlConn = SMARTSConnectionOpen();
		        DataBindPage(sqlConn);
		        grdName.EditItemIndex = -1;
		        grdDescription.EditItemIndex = -1;
		        grdAttribute.EditItemIndex = -1;
		        sqlConn.Close();
	        }
            else
            {
                Response.Redirect(String.Format("step.aspx?type={0}&id={1}", ddlTypeList.SelectedItem.Value, ddlList.SelectedItem.Value), false);
	        }
        }

        public void DataBindDependentList(object Sender, System.EventArgs E)
        {
	        DropDownList ddlType = (DropDownList)Sender;
	        int intType = int.Parse(ddlType.SelectedItem.Value);
	        DropDownList ddlShape = default(DropDownList);
	        DataGridItem item = (DataGridItem)ddlType.Parent.Parent;
	        DataTable sqlTable = new DataTable();
	        SqlCommand sqlCmd = default(SqlCommand);
	        SqlConnection sqlConn = SMARTSConnectionOpen();

	        switch (((DropDownList)Sender).ID)
            {
		        case "ddlRelatedBusiness":
			        ddlShape = (DropDownList)item.FindControl("ddlRelated");
                    sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", 
                        Common.TABLE_SHAPE, intType, Common.ABSTRACTION_BUSINESSSTEP), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        ddlShape.DataSource = sqlTable;
			        ddlShape.DataBind();

			        break;
		        case "ddlStepObjectSystem":
		        case "ddlStepObjectShapeType":
			        ddlShape = (DropDownList)item.FindControl("ddlStepObjectShape");

			        if (intType == Common.EMPTY_INT)
                    {
				        ddlShape.Items.Clear();
			        }
                    else
                    {
				        DropDownList ddlSystem = (DropDownList)item.FindControl("ddlStepObjectSystem");
                        sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", Common.TABLE_SHAPE, ddlSystem.SelectedItem.Value, Common.ABSTRACTION_SYSTEMOBJECT), sqlConn);
				        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
                        //DataRow drTemp = default(DataRow);
				        DropDownList ddlShapeType = (DropDownList)item.FindControl("ddlStepObjectShapeType");

                        foreach (DataRow drTemp in sqlTable.Rows)
                        {
					        if ((string)drTemp["Related_TypeID"] != ddlShapeType.SelectedItem.Value)
                            {
						        drTemp.Delete();
					        }
				        }
				        {
					        ddlShape.DataSource = sqlTable;
					        ddlShape.DataBind();
				        }

			        }

			        grdStepObject.SelectedIndex = grdStepObject.Items.Count;

			        break;
	        }

	        sqlConn.Close();
        }


        //--- GETS STA INFO : DESCRIPTION, CONSTRAINED VALUES, DEPENDENTS

        public void DataBindPage(SqlConnection sqlConn)
        {
	        lblMessage.Visible = false;

	        DataBindControl(grdName, sqlConn);

	        if (ddlList.SelectedIndex == Common.EMPTY_INT)
            {
		        grdDescription.Visible = false;
		        grdLifecycle.Visible = false;
                //grdAttribute.Visible = false;
                //grdArtifacts.Visible = false;
		        grdRelations.Visible = false;
		        grdStepObject.Visible = false;
		        lblStub.Visible = false;
		        urlChangeContainer.Visible = false;
		        urlHistory.Visible = false;
		        urlBrowseThis.Visible = false;
	        }
            else
            {
                urlChangeContainer.NavigateUrl = String.Format("changecontainer.aspx?page=step.aspx&id={0}&type={1}", 
                    Request.QueryString["id"], Request.QueryString["type"]);
                urlHistory.NavigateUrl = String.Format("history.aspx?page=step.aspx&id={0}&type={1}", 
                    Request.QueryString["id"], Request.QueryString["type"]);
                urlBrowseThis.NavigateUrl = String.Format("../Smarts3Browser/step.aspx?id={0}&type={1}", 
                    Request.QueryString["id"], Request.QueryString["type"]);

		        if (grdName.Items.Count == Common.EMPTY_INT)
                {
			        //GOT NOTHING BACK, GET LIST OF LATEST
			        DataBindControl(ddlList, sqlConn);
			        lblMessage.Text = "Selection is unavailable. Please select another.";
			        lblMessage.Visible = true;
		        }
                else
                {
			        DataBindControl(grdDescription, sqlConn);
			        grdDescription.Visible = true;
			        DataBindControl(grdLifecycle, sqlConn);
			        grdLifecycle.Visible = true;
			        DataBindControl(grdAttribute, sqlConn);
			        grdAttribute.Visible = true;
                    //DataBindControl(grdArtifacts, sqlConn);
                    //grdArtifacts.Visible = true;
			        DataBindControl(grdRelations, sqlConn);
			        grdRelations.Visible = true;
			        DataBindControl(grdStepObject, sqlConn);
			        grdStepObject.Visible = true;

			        lblStub.Visible = true;

			        //--- HIDE EDIT COLUMN IF SHAPE IS RETIRED
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
            DropDownList ddlData2;
            
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
				        case "grdRelations":
					        strSQL = "EXEC GetShapeList " + Common.ABSTRACTION_BUSINESS + "," + Common.SHAPETYPE_BUSINESS + ";";
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
					        ddlData = (DropDownList)E.Item.FindControl("ddlRelatedBusiness");
					        ddlData.DataSource = sqlTable;
					        ddlData.DataBind();
                            ddlData.Items.FindByValue(ddlBusinessList.SelectedValue).Selected = true;
					        strSQL = String.Format("EXEC GetItem_Contained {0},{1},{2};", Common.TABLE_SHAPE, ddlData.SelectedItem.Value, Common.ABSTRACTION_BUSINESSSTEP);
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
					        ddlData2 = (DropDownList)E.Item.FindControl("ddlRelated");
					        ddlData2.DataSource = sqlTable;
					        ddlData2.DataBind();
					        break;

				        case "grdStepObject":
					        strSQL = "EXEC GetShapeList " + Common.ABSTRACTION_SYSTEM + "," +  Common.SHAPETYPE_SYSTEM;
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
					        ddlData = (DropDownList)E.Item.FindControl("ddlStepObjectSystem");
					        ddlData.DataSource = sqlTable;
					        ddlData.DataBind();
					        strSQL = "EXEC GetShapeTypeList " +  Common.ABSTRACTION_OBJECT;
					        sqlCmd = new SqlCommand(strSQL, sqlConn);
					        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
					        ddlData2 = (DropDownList)E.Item.FindControl("ddlStepObjectShapeType");
					        ddlData2.DataSource = sqlTable;
					        ddlData2.DataBind();
					        ddlData.Items.Insert(0, CreateListItem("SELECT"));
					        ddlData2.Items.Insert(0, CreateListItem("SELECT"));
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

					        if (grdRelations.Items.Count > 0)
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