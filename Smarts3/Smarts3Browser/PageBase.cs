using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Smarts3;

namespace Smarts3Browser
{
    public class PageBase : System.Web.UI.Page
    {
        public SqlConnection SMARTSConnectionOpen()
        {
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            sqlConn.Open();
	        return sqlConn;
        }

        public void SetScroll()
        {
	        System.Text.StringBuilder saveScrollPosition = new System.Text.StringBuilder();
	        System.Text.StringBuilder setScrollPosition = new System.Text.StringBuilder();

	        ClientScript.RegisterHiddenField("__SCROLLPOS", "0");

	        saveScrollPosition.Append("<script language='javascript'>");
	        saveScrollPosition.Append("function saveScrollPosition() {");
	        saveScrollPosition.Append(" document.forms[0].__SCROLLPOS.value = theBody.scrollTop;");
	        saveScrollPosition.Append("}");
	        saveScrollPosition.Append("theBody.onscroll=saveScrollPosition;");
	        saveScrollPosition.Append("</script>");

	        ClientScript.RegisterStartupScript(typeof(string), "saveScroll", saveScrollPosition.ToString());
        }

        public void SaveScroll()
        {
	        StringBuilder saveScrollPosition = new StringBuilder();
	        StringBuilder setScrollPosition = new StringBuilder();

	        setScrollPosition.Append("<script language='javascript'>");
	        setScrollPosition.Append("function setScrollPosition() {");

	        setScrollPosition.Append(" theBody.scrollTop = " + Request["__SCROLLPOS"] + ";");
	        setScrollPosition.Append("}");
	        setScrollPosition.Append("theBody.onload=setScrollPosition;");
	        setScrollPosition.Append("</script>");

	        ClientScript.RegisterStartupScript(typeof(string), "setScroll", setScrollPosition.ToString());
        }

        public void setFocus(object Source, DataGridCommandEventArgs E)
        {
	        Control ctrl = default(Control);
            DataGrid dataGrid = (DataGrid)Source;

	        switch (dataGrid.ID)
            {
		        case "grdName":
			        ctrl = dataGrid.Items[E.Item.ItemIndex].Cells[1].FindControl("txtName");
			        break;

		        case "grdDescription":
			        ctrl = dataGrid.Items[E.Item.ItemIndex].Cells[1].FindControl("txtDescription");
			        break;

		        case "grdLifecycle":
			        ctrl = dataGrid.Items[E.Item.ItemIndex].Cells[1].FindControl("ddlLifecycle");
			        break;

		        case "grdLocation":
			        ctrl = dataGrid.Items[E.Item.ItemIndex].Cells[1].FindControl("txtLocation");
			        break;

		        case "grdContact":
			        ctrl = dataGrid.Items[E.Item.ItemIndex].Cells[1].FindControl("txtContact");
			        break;

		        case "grdNote":
			        ctrl = dataGrid.Items[E.Item.ItemIndex].Cells[1].FindControl("txtNote");
			        break;

		        case "grdConstrainedValues":
			        ctrl = dataGrid.Items[E.Item.ItemIndex].Cells[1].FindControl("txtConstrainedValues");
			        break;

		        case "grdAttribute":
			        DropDownList ctlAttribute = (DropDownList)dataGrid.Items[E.Item.ItemIndex].Cells[1].FindControl("ddlAttributeValue");

			        if (ctlAttribute.Items.Count == Common.EMPTY_INT)
                    {
				        ctrl = dataGrid.Items[E.Item.ItemIndex].Cells[1].FindControl("txtAttributeValue");
			        } 
                    else
                    {
				        ctrl = dataGrid.Items[E.Item.ItemIndex].Cells[1].FindControl("ddlAttributeValue");
			        }
			        break;

		        default:
			        //--- NO NEED TO SET FOCUS ON OTHER CONTROLS, EXIT
			        return;
	        }

	        //Set the script to focus and select the control
            string strFocus = String.Format("<script language=\"JavaScript\">{0}{1}theForm.{2}.focus();{0}{1}theForm.{2}.select();{0}</script>", 
                Environment.NewLine, "\t", ctrl.ClientID);
	        ClientScript.RegisterStartupScript(typeof(string), "focus", strFocus);

        }

        public string RewriteString(string strContent)
        {
	        string strTemp = null;

            strTemp = string.Format("'{0}'", strContent.Replace("'", "''").Trim());

	        return strTemp;
        }


        public string Dummylink(string strlink)
        {
            if (strlink.Trim().Length == Common.EMPTY_INT)
            {
    	        return "[VIEW RELATION]";
            }
            else
            {
		        return strlink;
	        }
        }

        //public DropDownList GetArtifacts(DropDownList ddlData, SqlConnection sqlConn)
        //{
        //    SqlCommand sqlCmd = new SqlCommand("GetArtifactList", sqlConn);
        //    SqlDataReader reader = sqlCmd.ExecuteReader();

        //    DataTable sqlTable = new DataTable();
        //    sqlTable.Load(reader);

        //    if (sqlTable.Rows.Count > 0)
        //    {
        //        ddlData.DataSource = sqlTable;
        //        ddlData.DataBind();
        //    }

        //    ddlData.Items.Insert(0, CreateListItem("CREATE NEW ARTIFACT"));

        //    return ddlData;
        //}

        ////--- RETURNS FALSE if Artifact is already linked to item
        ////--- RETURNS TRUE if Artifact is not linked to item
        //public bool booSetArtifact(SqlConnection sqlConn, int intItem, int intValue)
        //{

        //    string strSQL = null;
        //    SqlCommand sqlCmd = default(SqlCommand);

        //    strSQL = "GetItem_Contained " + Common.TABLE_SHAPE + "," + intItem + "," + Common.ABSTRACTION_ARTIFACT;
        //    sqlCmd = new SqlCommand(strSQL, sqlConn);
        //    SqlDataReader reader = sqlCmd.ExecuteReader();
        //    DataTable sqlTable = new DataTable();
        //    sqlTable.Load(reader);

        //    for (int i = 0; i <= sqlTable.Rows.Count - 1; i++)
        //    {
        //        if ((int)sqlTable.Rows[i]["Related_ID"] == intValue)
        //        {
        //            //--- linked already
        //            return false;
        //            break; // TODO: might not be correct. Was : Exit For
        //        }
        //    }

        //    //--- link Artifact
        //    strSQL = "SetContainer " + Common.TABLE_SHAPE + "," + intItem + "," + Common.TABLE_ARTIFACT + "," + intValue + "," + Common.ABSTRACTION_ARTIFACT + "," + Common. LOGFUNCTION_SET_CONTAINER + "," + RewriteString(User.Identity.Name);
        //    sqlCmd = new SqlCommand(strSQL, sqlConn);
        //    sqlCmd.ExecuteNonQuery();
        //    return true;

        //}

        //--- Sets item lifecycle

        public void subSetLifecycle(SqlConnection sqlConn, int intItem, DataGridCommandEventArgs E)
        {
	        int intValue = int.Parse(((DropDownList)E.Item.FindControl("ddlLifecycle")).SelectedItem.Value);
            string strSQL = String.Format("SetItem_Lifecycle {0},{1},{2},{3},{4}", 
                Common.TABLE_SHAPE, intItem, Common.LOGFUNCTION_SET_LIFECYCLE, intValue, RewriteString(User.Identity.Name));
	        SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
	        sqlCmd.ExecuteNonQuery();
        }


        public static ListItem CreateListItem(string strText)
        {

	        ListItem lstItem = new ListItem();

            lstItem.Text = String.Format("--{0}--", strText);
	        lstItem.Value = Common.EMPTY_INT.ToString();

	        return lstItem;

        }


        public void PopulateControl_Attributes(DataGridItemEventArgs e, SqlConnection sqlConn, DropDownList ddlList)
        {
	        DropDownList ddlValue = (DropDownList)e.Item.FindControl("ddlAttributeValue");
	        TextBox txtValue = (TextBox)e.Item.FindControl("txtAttributeValue");
	        int intSTA_ID = int.Parse(((Label)e.Item.FindControl("lblSTA_ID")).Text);

            string strSQL = String.Format("GetItem_ConstrainedValues {0},{1}", Smarts3.Common.TABLE_SHAPETYPEATTRIBUTE, intSTA_ID);
	        SqlCommand sqlCmd = new SqlCommand(strSQL, sqlConn);
            SqlDataReader reader = sqlCmd.ExecuteReader();
            DataTable sqlTable = new DataTable();
            sqlTable.Load(reader);

	        if (sqlTable.Rows.Count > 0)
            {
		        string strToParse = (string)sqlTable.Rows[0]["ConstrainedValue_Values"];
                string[] arrValues = strToParse.Split(',');
		        int i = 0;
        
		        for (i = 0; i <= arrValues.GetUpperBound(1) ; i++)
                {
			        ddlValue.Items.Add((arrValues[i]).Trim());
		        }

		        txtValue.Text = txtValue.Text.Trim();

		        if (txtValue.Text.Length > 0)
                {
			        ddlValue.SelectedIndex = ddlValue.Items.IndexOf(ddlValue.Items.FindByText(txtValue.Text));
		        }

		        ddlValue.Visible = true;
		        txtValue.Visible = false;
	        }
            else
            {
		        ddlValue.Visible = false;
		        txtValue.Visible = true;
	        }

        }


        public int SecureEditing(int intDivision)
        {
	        int functionReturnValue = 0;

	        //--- RETURN STUB FOR NOW
            return Smarts3.Common.SECURITY_SCHEMA;
            //return functionReturnValue;

	        //--- PASS IN THE DIVISION OF THE SHAPE. DETERMINES EDITING RIGHTS
	        //--- SELECT DIVISION
	        switch (intDivision)
            {
                case Smarts3.Common.DIVISION_LIFE:
			        if (User.IsInRole("pacificmutual\\SmartStar_Life_Schema"))
                    {
                        return Smarts3.Common.SECURITY_SCHEMA;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Life_Shape"))
                    {
                        return Smarts3.Common.SECURITY_SHAPE;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Life_Attribute"))
                    {
                        return Smarts3.Common.SECURITY_ATTRIBUTE;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Life_Association"))
                    {
                        return Smarts3.Common.SECURITY_ASSOC;
			        } 
                    else
                    {
                        return Smarts3.Common.EMPTY_INT;
			        }
			        break;

                case Smarts3.Common.DIVISION_CORPORATE:
			        if (User.IsInRole("pacificmutual\\SmartStar_Corporate_Schema"))
                    {
                        return Smarts3.Common.SECURITY_SCHEMA;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Corporate_Shape"))
                    {
                        return Smarts3.Common.SECURITY_SHAPE;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Corporate_Attribute"))
                    {
                        return Smarts3.Common.SECURITY_ATTRIBUTE;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Corporate_Association"))
                    {
                        return Smarts3.Common.SECURITY_ASSOC;
			        }
                    else
                    {
                        return Smarts3.Common.EMPTY_INT;
			        }
			        break;

                case Smarts3.Common.DIVISION_REALESTATE:
			        if (User.IsInRole("pacificmutual\\SmartStar_RealEstate_Schema"))
                    {
                        return Smarts3.Common.SECURITY_SCHEMA;
			        } 
                    else if (User.IsInRole("pacificmutual\\SmartStar_RealEstate_Shape"))
                    {
                        return Smarts3.Common.SECURITY_SHAPE;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_RealEstate_Attribute"))
                    {
                        return Smarts3.Common.SECURITY_ATTRIBUTE;
			        } else if (User.IsInRole("pacificmutual\\SmartStar_RealEstate_Association"))
                    {
                        return Smarts3.Common.SECURITY_ASSOC;
			        } 
                    else
                    {
                        return Smarts3.Common.EMPTY_INT;
			        }
			        break;
                case Smarts3.Common.DIVISION_ANNUITIES:
			        if (User.IsInRole("pacificmutual\\SmartStar_Annuities_Schema"))
                    {
                        return Smarts3.Common.SECURITY_SCHEMA;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Annuities_Shape"))
                    {
                        return Smarts3.Common.SECURITY_SHAPE;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Annuities_Attribute"))
                    {
                        return Smarts3.Common.SECURITY_ATTRIBUTE;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Annuities_Association"))
                    {
                        return Smarts3.Common.SECURITY_ASSOC;
			        } 
                    else
                    {
                        return Smarts3.Common.EMPTY_INT;
			        }
			        break;

                case Smarts3.Common.DIVISION_SECURITIES:
			        if (User.IsInRole("pacificmutual\\SmartStar_Securities_Schema"))
                    {
                        return Smarts3.Common.SECURITY_SCHEMA;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Securities_Shape")) 
                    {
                        return Smarts3.Common.SECURITY_SHAPE;
			        }
                    else if (User.IsInRole("pacificmutual\\SmartStar_Securities_Attribute"))
                    {
                        return Smarts3.Common.SECURITY_ATTRIBUTE;
			        } 
                    else if (User.IsInRole("pacificmutual\\SmartStar_Securities_Association"))
                    {
                        return Smarts3.Common.SECURITY_ASSOC;
			        } 
                    else
                    {
                        return Smarts3.Common.EMPTY_INT;
			        }
			        break;

		        default:
			        //HAS NO EDITING ABILITY
			        return Smarts3.Common.EMPTY_INT;
	        }

	        return functionReturnValue;

	        //--- SELECT SECURIY LEVEL WITHIN DIVISION

        }

    }
}