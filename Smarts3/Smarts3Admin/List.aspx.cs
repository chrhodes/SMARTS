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
    public partial class List : PageBase
    {
        protected System.Web.UI.WebControls.ListBox grdDesc;


        #region Initialization

        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            //Put user code to initialize the page here


            if (!Page.IsPostBack)
            {
                SqlConnection sqlConn = SMARTSConnectionOpen();
                DataBindList(sqlConn);
                sqlConn.Close();
            }
        }

        #endregion

        protected void DataBindList(SqlConnection sqlConn)
        {
            SqlCommand sqlCmd = null;
            SqlDataReader sqlReader;
            DataSet sqlSet = new DataSet();

            //**** GET LIST & LABEL NAME ***
            switch (int.Parse(Request.QueryString["list"]))
            {
                case Common.LIST_ARTIFACTS:
                    Label1.Text = "Existing Artifacts";
                    sqlCmd = new SqlCommand("GetArtifactList", sqlConn);
                    break;
                case Common.LIST_ATTRIBUTES:
                    Label1.Text = "Existing Attributes";
                    sqlCmd = new SqlCommand("GetAttributeList", sqlConn);
                    break;
                case Common.LIST_SYSTEMS:
                    Label1.Text = "Existing Systems";
                    sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_SYSTEM + ",NULL", sqlConn);
                    break;
                case Common.LIST_OBJECTS:
                    Label1.Text = "Existing Objects";
                    sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_OBJECT + ",NULL", sqlConn);
                    break;
                case Common.LIST_DEVICES:
                    Label1.Text = "Existing Devices";
                    sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_DEVICE + ",NULL", sqlConn);
                    break;
                case Common.LIST_PIECES:
                    Label1.Text = "Existing Functional Pieces";
                    sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_PIECE + ",NULL", sqlConn);
                    break;
                case Common.LIST_BUSINESSES:
                    Label1.Text = "Existing Business Processes";
                    sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_BUSINESS + ",NULL", sqlConn);
                    break;
                case Common.LIST_STEPS:
                    Label1.Text = "Existing Process Steps";
                    sqlCmd = new SqlCommand("GetShapeList " + Common.ABSTRACTION_STEP + ",NULL", sqlConn);
                    break;
            }

            sqlReader = sqlCmd.ExecuteReader();

            grdList.DataSource = sqlReader;

            //**** GET TEXT & VALUES ***
            switch (int.Parse(Request.QueryString["list"]))
            {
                case Common.LIST_ARTIFACTS:
                    grdList.DataTextField = "Artifact_Name";
                    grdList.DataValueField = "Artifact_ID";
                    break;
                case Common.LIST_ATTRIBUTES:
                    grdList.DataTextField = "Attribute_Name";
                    grdList.DataValueField = "Attribute_ID";
                    break;
                case Common.LIST_SYSTEMS:
                case Common.LIST_OBJECTS:
                case Common.LIST_DEVICES:
                case Common. LIST_PIECES:
                case Common.LIST_BUSINESSES:
                case Common.LIST_STEPS:
                    grdList.DataTextField = "shape_name";
                    grdList.DataValueField = "shape_id";
                    break;
            }

            grdList.DataBind();

            sqlReader.Close();
        }

    }
}