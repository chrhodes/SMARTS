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
    public partial class Object : PageBase
    {
        protected System.Web.UI.WebControls.DropDownList ddlRelated;
        protected System.Web.UI.WebControls.DropDownList ddlRelatedSystem;

        protected void DataBindControl(object Source, SqlConnection sqlConn)
        {
            DropDownList ddlList = (DropDownList)Source;

	        SqlCommand sqlCmd = default(SqlCommand);
	        DataTable sqlTable = new DataTable();

            switch (ddlList.ID)
            {
		        case "ddlSystemList":
		        case "ddlRelatedSystem":
			        sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_SYSTEM + ",NULL", sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "ddlTypeList":
			        sqlCmd = new SqlCommand("GetShapeTypeList " +  Common.ABSTRACTION_OBJECT, sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "ddlList":
                    sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", 
                        Common.TABLE_SHAPE, ddlSystemList.SelectedItem.Value, Common.ABSTRACTION_SYSTEMOBJECT), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);

                    foreach (DataRow drTemp in sqlTable.Rows)
                    {
				        if (drTemp["Related_TypeID"] != ddlTypeList.SelectedItem.Value)
                        {
					        drTemp.Delete();
				        }
			        }

			        break;

		        case "grdName":
			        if (ddlList.SelectedIndex == Common.EMPTY_INT)
                    {
				        sqlTable = CreateDataTable();
			        }
                    else
                    {
                        sqlCmd = new SqlCommand(String.Format("GetItem_Container {0},{1},{2};", 
                            Common.TABLE_SHAPE, Convert.ToInt32(ddlList.SelectedItem.Value), Common.ABSTRACTION_SYSTEMOBJECT), sqlConn);
				        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        }

			        break;

		        case "grdDescription":
		        case "grdLifecycle":
                    sqlCmd = new SqlCommand(String.Format("GetItem {0},{1}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdAttribute":
                    sqlCmd = new SqlCommand(String.Format("GetItem_AttributeValue {0},{1},NULL", Common.TABLE_SHAPE, ddlList.SelectedItem.Value), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdDeviceObject":
                    sqlCmd = new SqlCommand(String.Format("GetItem_Container {0},{1},{2}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_DEVICEOBJECT), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "grdStepObject":
                    sqlCmd = new SqlCommand(String.Format("GetItem_Container {0},{1},{2}", Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.ABSTRACTION_STEPOBJECT), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

		        case "ddlRelated":
                    sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", Common.TABLE_SHAPE, ddlRelatedSystem.SelectedItem.Value, Common.ABSTRACTION_SYSTEMOBJECT), sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;

                //case "grdArtifacts":
                //    sqlCmd = new SqlCommand("GetItem_Contained " + Common.TABLE_SHAPE + "," + ddlList.SelectedItem.Value + "," + Common.ABSTRACTION_ARTIFACT, sqlConn);
                //    sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
                //    break;

		        case "grdRelations":
			        sqlCmd = new SqlCommand("GetItem_Relation NULL," + Common.TABLE_SHAPE + "," + ddlList.SelectedItem.Value + "," +  Common.ABSTRACTION_OBJECT, sqlConn);
			        sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        break;
	        }

            ddlList.DataSource = sqlTable;
            ddlList.DataBind();

            switch (ddlList.ID)
            {
		        case "ddlList":
			        ddlList.Items.Insert(0, CreateListItem("CREATE NEW OBJECT"));
			        break;

                //case "grdAttribute":
                //    for (int i = 0; i <= ddlList.Items.Count - 1; i++)
                //    {
                //        Label lblValue = (Label)ddlList.Items[i].Cells[2].FindControl("lblAttributeValue");
                //        HyperLink urlValue = (HyperLink)ddlList.Items[i].Cells[2].FindControl("urlAttributeValue");
                //        if ((lblValue != null))
                //        {
                //            try 
                //            {
                //                Uri u = new Uri(lblValue.Text);
                //                urlValue.Visible = true;
                //                lblValue.Visible = false;
                //            }
                //            catch (UriFormatException ex)
                //            {
                //                urlValue.Visible = false;
                //                lblValue.Visible = true;
                //            }
                //        }
                //    }

                //    break;
	        }
        }


        public void ControlDeleteCommand(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;

	        string strSQL = null;


	        if (E.CommandName == "Delete")
            {
		        SqlConnection sqlConn = SMARTSConnectionOpen();

                switch (dataGrid.ID)
                {
                    //case "grdArtifacts":
                    //    strSQL = "DeleteItem_Artifact " + Convert.ToInt32(((Label)E.Item.FindControl("lblArtifactID")).Text) + "," + Common.TABLE_SHAPE + "," + Convert.ToInt32(ddlList.SelectedItem.Value) + "," +  Common.LOGFUNCTION_DELETE_CONTAINER + "," + RewriteString(User.Identity.Name);
                    //    break;

			        case "grdRelations":
				        strSQL = "DeleteRelation " + Common.TABLE_RELATION + "," + Convert.ToInt32(((Label)E.Item.FindControl("lblRelationID")).Text) + "," +  Common.ABSTRACTION_OBJECT + "," + Common.LOGFUNCTION_DELETE_RELATION + "," + RewriteString(User.Identity.Name);
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
	        string strSQL = null;
	        string strValue = null;
	        int intValue = 0;
	        int intDirection = 0;
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
                    //        Response.Redirect("artifact.aspx?id=" + ddlList.SelectedItem.Value + "&type=" + ddlTypeList.SelectedItem.Value + "&artifact=" + Common.EMPTY_INT, false);
                    //        return;
                    //    }
                    //    else
                    //    {
                    //        //--- IF ARTIFACT IS NOT ALREADY ADDED, ADD IT
                    //        if (booSetArtifact(sqlConn, ddlList.SelectedItem.Value, intValue) == true)
                    //        {
                    //            DataBindControl(Source, sqlConn);
                    //        }
                    //    }
                    //    break;

			        case "grdLifecycle":
				        subSetLifecycle(sqlConn, int.Parse(ddlList.SelectedItem.Value), E);
				        DataBindControl(dataGrid, sqlConn);
				        break;

			        case "grdRelations":
				        if (((DropDownList)E.Item.FindControl("ddlRelated")).Items.Count != Common.EMPTY_INT)
                        {
					        intValue = int.Parse(((DropDownList)E.Item.FindControl("ddlRelated")).SelectedItem.Value);
					        strValue = RewriteString(((TextBox)E.Item.FindControl("txtRelation_Name")).Text);
					        intDirection = int.Parse(((DropDownList)E.Item.FindControl("ddlDirection")).SelectedItem.Value);
					        if (intDirection == Common.DIRECTION_TO)
                            {
                                strSQL = String.Format("SetRelation NULL,{0},{1},{2},{1},{3},{4},{5},{6}", strValue, Common.TABLE_SHAPE, ddlList.SelectedItem.Value, intValue, Common.ABSTRACTION_OBJECT, Common.LOGFUNCTION_SET_RELATION, RewriteString(User.Identity.Name));
					        }
                            else
                            {
                                strSQL = String.Format("SetRelation NULL,{0},{1},{2},{1},{3},{4},{5},{6}", strValue, Common.TABLE_SHAPE, intValue, ddlList.SelectedItem.Value, Common.ABSTRACTION_OBJECT, Common.LOGFUNCTION_SET_RELATION, RewriteString(User.Identity.Name));
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


        private void ToggleEditColumn(int intDivision, int intLifecycle)
        {
	        int intSecurityLevel = SecureEditing(intDivision);

	        //-- START MAKING EVERYTHING UNEDITABLE
	        grdRelations.Columns[0].Visible = false;
	        grdRelations.ShowFooter = false;
	        grdAttribute.Columns[0].Visible = false;
            //grdArtifacts.Columns[0].Visible = false;
            //grdArtifacts.ShowFooter = false;
	        grdLifecycle.Columns[0].Visible = false;
	        grdName.Columns[0].Visible = false;
	        grdDescription.Columns[0].Visible = false;

	        //-- IF USER HAS SECURITY ACCESS, MAKE THIS VISIBLE
	        if (intSecurityLevel >= Common.SECURITY_SHAPE)
            {
		        grdLifecycle.Columns[0].Visible = true;
	        }

	        //-- IF NOT RETIRED, TOGGLE EDITING ACCORDING TO SECURITY ACCESS
	        if (intLifecycle != Common.LIFECYCLE_RETIRE)
            {
		        if (intSecurityLevel >= Common.SECURITY_ASSOC)
                {
			        grdRelations.Columns[0].Visible = true;
			        grdRelations.ShowFooter = true;
			        if (intSecurityLevel >= Common.SECURITY_ATTRIBUTE)
                    {
				        grdAttribute.Columns[0].Visible = true;
                        //grdArtifacts.Columns[0].Visible = true;
                        //grdArtifacts.ShowFooter = true;

				        if (intSecurityLevel >= Common.SECURITY_SHAPE)
                        {
					        grdName.Columns[0].Visible = true;
					        grdDescription.Columns[0].Visible = true;
				        }
			        }
		        }
	        }
        }


        public void ControlEdit(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;
	        dataGrid.EditItemIndex = E.Item.ItemIndex;

	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        DataBindControl(dataGrid, sqlConn);
	        sqlConn.Close();

	        setFocus(Source, E);
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



        public void ControlUpdate(object Source, DataGridCommandEventArgs E)
        {
            DataGrid dataGrid = (DataGrid)Source;
	        string strSQL = null;
	        int intValue = 0;
	        string strValue = null;
            DropDownList ddlValues;

	        switch (dataGrid.ID)
            {
		        case "grdLifecycle":
			        ddlValues = (DropDownList)E.Item.FindControl("ddlLifecycle");
			        intValue = Convert.ToInt32(ddlValues.SelectedItem.Value);
                    strSQL = String.Format("SetItem_Lifecycle {0},{1},{2},{3},{4}", 
                        Common.TABLE_SHAPE, ddlList.SelectedItem.Value, Common.LOGFUNCTION_SET_LIFECYCLE, intValue, RewriteString(User.Identity.Name));
			        ToggleEditColumn(Common.STUB_intDivision, intValue);
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
					        if (ddlList.SelectedIndex != i && strValue.ToUpper() == ddlList.Items[i].Text.ToUpper());
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

	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
	        sqlCmd.ExecuteNonQuery();

	        dataGrid.EditItemIndex = -1;
	        DataBindControl(dataGrid, sqlConn);

	        if (dataGrid.ID == "grdDescription" || dataGrid.ID == "grdName")
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

        public void SubmitToDB(string strName)
        {
	        SqlConnection sqlConn = SMARTSConnectionOpen();
	        SqlCommand sqlCmd = new SqlCommand("SetItem", sqlConn);

	        sqlCmd.CommandType = CommandType.StoredProcedure;

	        sqlCmd.Parameters.AddWithValue("@Table", Common.TABLE_SHAPE);
	        sqlCmd.Parameters.AddWithValue("@ShapeType", ddlTypeList.SelectedItem.Value);
	        sqlCmd.Parameters.AddWithValue("@Lifecycle", Common.LIFECYCLE_CURRENT);
	        sqlCmd.Parameters.AddWithValue("@Function", Common.LOGFUNCTION_SET_SHAPE);
		    sqlCmd.Parameters.AddWithValue("@Value", strName.Trim().Replace("'", "''"));
		    sqlCmd.Parameters.AddWithValue("@Contact", User.Identity.Name.Trim().Replace("'", "''"));
		    sqlCmd.Parameters.AddWithValue("@NewID", 0).Direction = ParameterDirection.Output;

	        sqlCmd.ExecuteNonQuery();
	        string strObject = sqlCmd.Parameters["@NewID"].Value.ToString();
	        sqlCmd = null;
            string strSQL = String.Format("SetContainer {0},{1},{0},{2},{3},{4},{5}", 
                Common.TABLE_SHAPE, ddlSystemList.SelectedItem.Value, Convert.ToInt32(strObject), Common.ABSTRACTION_SYSTEMOBJECT, Common.LOGFUNCTION_SET_SHAPE, RewriteString(User.Identity.Name));
	        sqlCmd = new SqlCommand(strSQL, sqlConn);
	        sqlCmd.ExecuteNonQuery();

	        sqlConn.Close();

            Response.Redirect(String.Format("object.aspx?type={0}&id={1}", ddlTypeList.SelectedItem.Value, strObject), false);
        }



        private void  // ERROR: Handles clauses are not supported in C#
        Page_Load(System.Object sender, System.EventArgs e)
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

		        DataBindControl(ddlTypeList, sqlConn);
		        DataBindControl(ddlSystemList, sqlConn);

		        if (Request.QueryString["id"].Length > 0)
                {
			        ddlTypeList.SelectedIndex = ddlTypeList.Items.IndexOf(ddlTypeList.Items.FindByValue(Request.QueryString["type"]));
                    SqlCommand sqlCmd = new SqlCommand(String.Format("GetItem_Container {0},{1},{2}", 
                        Common.TABLE_SHAPE, Request.QueryString["id"], Common.ABSTRACTION_SYSTEMOBJECT), sqlConn);
			        DataTable sqlTable = sqlCmd.ExecuteDataTable(sqlConn);
			        int intID = sqlTable.Rows[0].Field<int>("Related_ID");
			        ddlSystemList.SelectedIndex = ddlSystemList.Items.IndexOf(ddlSystemList.Items.FindByValue(intID.ToString()));
			        DataBindControl(ddlList, sqlConn);
			        ddlList.SelectedIndex = ddlList.Items.IndexOf(ddlList.Items.FindByValue(Request.QueryString["id"]));
		        } 
                else
                {
			        ddlTypeList.SelectedIndex = 0;
			        ddlSystemList.SelectedIndex = 0;
			        DataBindControl(ddlList, sqlConn);
			        ddlList.SelectedIndex = 0;
		        }

		        DataBindPage(sqlConn);
		        sqlConn.Close();

	        }
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
		        Response.Redirect("object.aspx?type=" + ddlTypeList.SelectedItem.Value + "&id=" + ddlList.SelectedItem.Value, false);
		        return;
	        }
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



        private void  ddlSystemList_SelectedIndexChanged(System.Object sender, System.EventArgs e)
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

        public void DataBindDependentList(object Sender, System.EventArgs E)
        {
	        if (((DropDownList)Sender).ID == "ddlRelatedSystem")
            {
		        //Get the Shape DropDown
		        DropDownList ddlSys = (DropDownList)Sender;
		        int intSys = int.Parse(ddlSys.SelectedItem.Value);
		        SqlConnection sqlConn = SMARTSConnectionOpen();
                SqlCommand sqlCmd = new SqlCommand(String.Format("GetItem_Contained {0},{1},{2}", Common.TABLE_SHAPE, intSys, Common.ABSTRACTION_SYSTEMOBJECT), sqlConn);
		        DataTable sqlTable = sqlCmd.ExecuteDataTable(sqlConn);

		        DataGridItem item = (DataGridItem)ddlSys.Parent.Parent;
		        DropDownList ddlShape = (DropDownList)item.FindControl("ddlRelated");
		        ddlShape.DataSource = sqlTable;
		        ddlShape.DataBind();

		        sqlConn.Close();
	        }
        }


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
	        dtRow["PrincipalContainer_ID"] = ddlSystemList.SelectedItem.Value;
	        dtRow["PrincipalContainer_Name"] = ddlSystemList.SelectedItem.Text;
	        dtTable.Rows.Add(dtRow);
	        dtTable.AcceptChanges();

	        return dtTable;
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
		        grdAttribute.Visible = false;
                //grdArtifacts.Visible = false;
		        grdRelations.Visible = false;
		        grdDeviceObject.Visible = false;
		        grdStepObject.Visible = false;
		        lblStub.Visible = false;
		        urlChangeContainer.Visible = false;
		        urlHistory.Visible = false;
		        urlBrowseThis.Visible = false;
	        } 
            else 
            {
                urlHistory.NavigateUrl = String.Format("history.aspx?page=object.aspx&id={0}&type={1}", Request.QueryString["id"], Request.QueryString["type"]);
                urlChangeContainer.NavigateUrl = String.Format("changecontainer.aspx?page=object.aspx&id={0}&type={1}", Request.QueryString["id"], Request.QueryString["type"]);
                urlBrowseThis.NavigateUrl = String.Format("../Smarts3Browser/object.aspx?id={0}&type={1}", Request.QueryString["id"], Request.QueryString["type"]);

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
			        DataBindControl(grdDeviceObject, sqlConn);
			        grdDeviceObject.Visible = true;
			        DataBindControl(grdStepObject, sqlConn);
			        grdStepObject.Visible = true;

			        //--- STUB FOR LATER
			        lblStub.Visible = true;

			        //--- HIDE EDIT COLUMN IF SHAPE IS RETIRED, SHOW IF USER HAS CORRECT SECURITY LEVEL
                    //Label lblLifecycle = (Label)grdLifecycle.Items.Item[0].FindControl("lblLifecycle_ID");
			        Label lblLifecycle = (Label)grdLifecycle.FindControl("lblLifecycle_ID");
			        ToggleEditColumn(Common.STUB_intDivision, Convert.ToInt32(lblLifecycle.Text));

		        }
	        }
        }

        public void ControlItemDataBound(object Source, DataGridItemEventArgs E)
        {
            DataGridItem dataGridItem = (DataGridItem)Source;

	        ListItemType typItem = E.Item.ItemType;
	        SqlCommand sqlCmd = default(SqlCommand);
	        DataTable sqlTable = new DataTable();
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

				        case "grdRelations":
					        DropDownList ddlData = (DropDownList)E.Item.FindControl("ddlRelatedSystem");
					        sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_SYSTEM + "," +  Common.SHAPETYPE_SYSTEM, sqlConn);
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

					        if (grdRelations.Items.Count > 0)
                            {
						        ddlValue.Items.RemoveAt(ddlValue.Items.IndexOf(ddlValue.Items.FindByValue(Common.LIFECYCLE_RETIRE.ToString())));
					        }

					        ToggleEditColumn(Common.STUB_intDivision, intValue);
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